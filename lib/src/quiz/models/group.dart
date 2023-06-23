import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kana_to_kanji/src/quiz/constants/alphabets.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class Group with _$Group {
  const factory Group(
      {required int id,
      required Alphabets alphabet,
      required String name,
      String? localizedName}) = _Group;

  factory Group.fromJson(Map<String, Object?> json) => _$GroupFromJson(json);

  static const tableCreate = "CREATE TABLE groups("
      "   id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "   alphabet TEXT NOT NULL, "
      "   name TEXT NOT NULL, "
      "   localizedName TEXT)";
}
