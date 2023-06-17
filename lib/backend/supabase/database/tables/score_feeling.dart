import '../database.dart';

class ScoreFeelingTable extends SupabaseTable<ScoreFeelingRow> {
  @override
  String get tableName => 'ScoreFeeling';

  @override
  ScoreFeelingRow createRow(Map<String, dynamic> data) => ScoreFeelingRow(data);
}

class ScoreFeelingRow extends SupabaseDataRow {
  ScoreFeelingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ScoreFeelingTable();

  int get idScoreFeeling => getField<int>('id_score_feeling')!;
  set idScoreFeeling(int value) => setField<int>('id_score_feeling', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get idSubject => getField<int>('id_subject');
  set idSubject(int? value) => setField<int>('id_subject', value);

  int? get amable => getField<int>('amable');
  set amable(int? value) => setField<int>('amable', value);

  int? get respetuoso => getField<int>('respetuoso');
  set respetuoso(int? value) => setField<int>('respetuoso', value);

  int? get responsable => getField<int>('responsable');
  set responsable(int? value) => setField<int>('responsable', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  int? get honesto => getField<int>('honesto');
  set honesto(int? value) => setField<int>('honesto', value);

  int? get alegre => getField<int>('alegre');
  set alegre(int? value) => setField<int>('alegre', value);

  int? get creativo => getField<int>('creativo');
  set creativo(int? value) => setField<int>('creativo', value);

  int? get dinamico => getField<int>('dinamico');
  set dinamico(int? value) => setField<int>('dinamico', value);

  int? get puntual => getField<int>('puntual');
  set puntual(int? value) => setField<int>('puntual', value);

  int? get compresivo => getField<int>('compresivo');
  set compresivo(int? value) => setField<int>('compresivo', value);

  int? get idTeacher => getField<int>('id_teacher');
  set idTeacher(int? value) => setField<int>('id_teacher', value);

  int? get idClass => getField<int>('id_class');
  set idClass(int? value) => setField<int>('id_class', value);

  String? get nameClass => getField<String>('name_class');
  set nameClass(String? value) => setField<String>('name_class', value);
}
