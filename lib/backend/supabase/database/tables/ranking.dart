import '../database.dart';

class RankingTable extends SupabaseTable<RankingRow> {
  @override
  String get tableName => 'Ranking';

  @override
  RankingRow createRow(Map<String, dynamic> data) => RankingRow(data);
}

class RankingRow extends SupabaseDataRow {
  RankingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RankingTable();

  int get idRanking => getField<int>('id_ranking')!;
  set idRanking(int value) => setField<int>('id_ranking', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int get idTeacher => getField<int>('id_teacher')!;
  set idTeacher(int value) => setField<int>('id_teacher', value);

  int? get score => getField<int>('score');
  set score(int? value) => setField<int>('score', value);
}
