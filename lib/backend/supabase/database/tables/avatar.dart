import '../database.dart';

class AvatarTable extends SupabaseTable<AvatarRow> {
  @override
  String get tableName => 'Avatar';

  @override
  AvatarRow createRow(Map<String, dynamic> data) => AvatarRow(data);
}

class AvatarRow extends SupabaseDataRow {
  AvatarRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AvatarTable();

  int get idAvatar => getField<int>('id_avatar')!;
  set idAvatar(int value) => setField<int>('id_avatar', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);
}
