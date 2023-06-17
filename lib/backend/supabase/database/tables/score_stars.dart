import '../database.dart';

class ScoreStarsTable extends SupabaseTable<ScoreStarsRow> {
  @override
  String get tableName => 'ScoreStars';

  @override
  ScoreStarsRow createRow(Map<String, dynamic> data) => ScoreStarsRow(data);
}

class ScoreStarsRow extends SupabaseDataRow {
  ScoreStarsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ScoreStarsTable();

  int get idScoreStar => getField<int>('id_score_star')!;
  set idScoreStar(int value) => setField<int>('id_score_star', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get idTeacher => getField<int>('id_teacher');
  set idTeacher(int? value) => setField<int>('id_teacher', value);

  int? get idClass => getField<int>('id_class');
  set idClass(int? value) => setField<int>('id_class', value);

  int? get score => getField<int>('score');
  set score(int? value) => setField<int>('score', value);

  String? get nameClass => getField<String>('name_class');
  set nameClass(String? value) => setField<String>('name_class', value);
}
