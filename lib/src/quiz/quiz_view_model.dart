import 'package:kana_to_kanji/src/core/models/group.dart';
import 'package:kana_to_kanji/src/core/repositories/kana_repository.dart';
import 'package:kana_to_kanji/src/core/repositories/settings_repository.dart';
import 'package:kana_to_kanji/src/locator.dart';
import 'package:kana_to_kanji/src/quiz/constants/question_types.dart';
import 'package:kana_to_kanji/src/quiz/models/question.dart';
import 'package:stacked/stacked.dart';

class QuizViewModel extends FutureViewModel {
  final KanaRepository _kanaRepository = locator<KanaRepository>();

  final SettingsRepository _settingsRepository = locator<SettingsRepository>();

  final List<Group> groups;

  final List<Question> _questions = [];

  int get quizLength => _questions.length;

  int _currentQuestionIndex = 0;

  int get questionNumber => _currentQuestionIndex + 1;

  int get attemptMaxNumber =>
      _settingsRepository.getMaximumAttemptsByQuestion();

  Question get current => _questions[_currentQuestionIndex];

  QuizViewModel(this.groups);

  @override
  Future futureToRun() async {
    final kana = await _kanaRepository
        .getByGroupIds(groups.map((e) => e.id).toList(growable: false));

    _questions.addAll(kana.map((element) => Question(
        kana: element,
        type: QuestionTypes.toRomanji,
        remainingAttempt: _settingsRepository.getMaximumAttemptsByQuestion())));
    _questions.shuffle();
  }

  void skipQuestion() {
    final skipped = _questions.removeAt(_currentQuestionIndex);
    _questions.add(skipped);
    notifyListeners();
  }

  bool validateAnswer(String answer) {
    final question = _questions[_currentQuestionIndex];

    if (answer != question.answer) {
      question.remainingAttempt -= 1;
      notifyListeners();
      return false;
    } else {
      Future.delayed(const Duration(milliseconds: 600), nextQuestion);
    }
    return true;
  }

  nextQuestion() {
    _currentQuestionIndex++;

    if (_currentQuestionIndex == _questions.length) {
      // TODO Trigger quiz end
    }
    notifyListeners();
  }
}
