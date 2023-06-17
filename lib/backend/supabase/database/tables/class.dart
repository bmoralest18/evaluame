import '../database.dart';

class ClassTable extends SupabaseTable<ClassRow> {
  @override
  String get tableName => 'Class';

  @override
  ClassRow createRow(Map<String, dynamic> data) => ClassRow(data);
}

class ClassRow extends SupabaseDataRow {
  ClassRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClassTable();

  int get idClass => getField<int>('id_class')!;
  set idClass(int value) => setField<int>('id_class', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get information => getField<String>('information')!;
  set information(String value) => setField<String>('information', value);

  int? get idTeacher => getField<int>('id_teacher');
  set idTeacher(int? value) => setField<int>('id_teacher', value);
}
