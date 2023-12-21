import 'package:flutter/foundation.dart';
import 'package:kana_to_kanji/src/core/models/kanji.dart';
import 'package:kana_to_kanji/src/core/services/kanji_service.dart';

class KanjiRepository {
  late final KanjiService _kanjiService;

  @visibleForTesting
  final List<Kanji> kanjis = [];

  /// [kanjiService] should only be used for testing
  KanjiRepository({KanjiService? kanjiService}) {
    _kanjiService = kanjiService ?? KanjiService();
  }

  /// Retrieve all the kanji from the database
  List<Kanji> getAll() {
    if (kanjis.isNotEmpty) {
      return kanjis;
    }
    kanjis.addAll(_kanjiService.getAll());

    return kanjis;
  }
}
