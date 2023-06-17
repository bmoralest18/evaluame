import '../database.dart';

class ReviewTable extends SupabaseTable<ReviewRow> {
  @override
  String get tableName => 'Review';

  @override
  ReviewRow createRow(Map<String, dynamic> data) => ReviewRow(data);
}

class ReviewRow extends SupabaseDataRow {
  ReviewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReviewTable();

  int get idReview => getField<int>('id_review')!;
  set idReview(int value) => setField<int>('id_review', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  int? get idSubject => getField<int>('id_subject');
  set idSubject(int? value) => setField<int>('id_subject', value);

  int? get idTeacher => getField<int>('id_teacher');
  set idTeacher(int? value) => setField<int>('id_teacher', value);
}
