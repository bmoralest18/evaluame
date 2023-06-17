import '../database.dart';

class StudentTable extends SupabaseTable<StudentRow> {
  @override
  String get tableName => 'Student';

  @override
  StudentRow createRow(Map<String, dynamic> data) => StudentRow(data);
}

class StudentRow extends SupabaseDataRow {
  StudentRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StudentTable();

  int get idStudent => getField<int>('id_student')!;
  set idStudent(int value) => setField<int>('id_student', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get pseudonim => getField<String>('pseudonim')!;
  set pseudonim(String value) => setField<String>('pseudonim', value);

  String? get idUser => getField<String>('id_user');
  set idUser(String? value) => setField<String>('id_user', value);

  int? get idAvatar => getField<int>('id_avatar');
  set idAvatar(int? value) => setField<int>('id_avatar', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);
}
