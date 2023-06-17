import '../database.dart';

class StarTable extends SupabaseTable<StarRow> {
  @override
  String get tableName => 'Star';

  @override
  StarRow createRow(Map<String, dynamic> data) => StarRow(data);
}

class StarRow extends SupabaseDataRow {
  StarRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StarTable();

  int get idStar => getField<int>('id_star')!;
  set idStar(int value) => setField<int>('id_star', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int get rating => getField<int>('rating')!;
  set rating(int value) => setField<int>('rating', value);

  int? get idSubject => getField<int>('id_subject');
  set idSubject(int? value) => setField<int>('id_subject', value);

  int? get idTeacher => getField<int>('id_teacher');
  set idTeacher(int? value) => setField<int>('id_teacher', value);

  int? get idClass => getField<int>('id_class');
  set idClass(int? value) => setField<int>('id_class', value);

  String get nameClass => getField<String>('name_class')!;
  set nameClass(String value) => setField<String>('name_class', value);
}
