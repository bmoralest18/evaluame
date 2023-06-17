import '../database.dart';

class TeacherTable extends SupabaseTable<TeacherRow> {
  @override
  String get tableName => 'Teacher';

  @override
  TeacherRow createRow(Map<String, dynamic> data) => TeacherRow(data);
}

class TeacherRow extends SupabaseDataRow {
  TeacherRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TeacherTable();

  int get idTeacher => getField<int>('id_teacher')!;
  set idTeacher(int value) => setField<int>('id_teacher', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get surname => getField<String>('surname');
  set surname(String? value) => setField<String>('surname', value);

  String? get idUser => getField<String>('id_user');
  set idUser(String? value) => setField<String>('id_user', value);

  int? get idAvatar => getField<int>('id_avatar');
  set idAvatar(int? value) => setField<int>('id_avatar', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);
}
