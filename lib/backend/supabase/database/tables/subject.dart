import '../database.dart';

class SubjectTable extends SupabaseTable<SubjectRow> {
  @override
  String get tableName => 'Subject';

  @override
  SubjectRow createRow(Map<String, dynamic> data) => SubjectRow(data);
}

class SubjectRow extends SupabaseDataRow {
  SubjectRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SubjectTable();

  int get idSubject => getField<int>('id_subject')!;
  set idSubject(int value) => setField<int>('id_subject', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get idTeacher => getField<int>('id_teacher');
  set idTeacher(int? value) => setField<int>('id_teacher', value);

  int? get idStudent => getField<int>('id_student');
  set idStudent(int? value) => setField<int>('id_student', value);

  DateTime get initTime => getField<DateTime>('initTime')!;
  set initTime(DateTime value) => setField<DateTime>('initTime', value);

  DateTime get endTime => getField<DateTime>('endTime')!;
  set endTime(DateTime value) => setField<DateTime>('endTime', value);

  bool get isQualified => getField<bool>('isQualified')!;
  set isQualified(bool value) => setField<bool>('isQualified', value);

  int? get idClass => getField<int>('id_class');
  set idClass(int? value) => setField<int>('id_class', value);

  bool get isActive => getField<bool>('isActive')!;
  set isActive(bool value) => setField<bool>('isActive', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);
}
