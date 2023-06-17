import '../database.dart';

class DonBoscoTable extends SupabaseTable<DonBoscoRow> {
  @override
  String get tableName => 'DonBosco';

  @override
  DonBoscoRow createRow(Map<String, dynamic> data) => DonBoscoRow(data);
}

class DonBoscoRow extends SupabaseDataRow {
  DonBoscoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DonBoscoTable();

  int get idDon => getField<int>('id_don')!;
  set idDon(int value) => setField<int>('id_don', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int get rating => getField<int>('rating')!;
  set rating(int value) => setField<int>('rating', value);

  int? get idSubject => getField<int>('id_subject');
  set idSubject(int? value) => setField<int>('id_subject', value);

  int? get idTeacher => getField<int>('id_teacher');
  set idTeacher(int? value) => setField<int>('id_teacher', value);
}
