import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class NoteModel extends SyncableModel<Note> {
  NoteModel(
    super.id, {
    required this.title,
    required this.content,
    required this.edited,
    required this.chartId,
    super.storageState,
    super.syncStatus,
  });
  final String title;
  final String content;
  final DateTime edited;
  final int chartId;

  @override
  Note toEntity() {
    return Note(
      id,
      title: title,
      content: content,
      edited: edited,
      chartId: chartId,
      created: DateTime.fromMillisecondsSinceEpoch(id),
      storageState: storageState,
      syncStatus: syncStatus,
    );
  }

  @override
  Map<String, Object?> toCloud() {
    final map = dump();
    map.remove(columnId);
    map.remove(columnSyncStatus);
    return map;
  }

  @override
  Map<String, Object?> toSqlite() {
    final map = dump();
    map.remove(columnState);
    map.remove(columnSyncStatus);
    return map;
  }

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id,
      ColumnNote.title: title,
      ColumnNote.content: content,
      ColumnNote.chartId: chartId,
      ColumnNote.edited: edited.millisecondsSinceEpoch,
      columnState: storageState,
      columnSyncStatus: syncStatus,
    };
  }

  static NoteModel fromMap(Map<String, Object?> map) {
    return NoteModel(
      map[columnId] as int,
      title: map[ColumnNote.title] as String,
      content: map[ColumnNote.content] as String,
      chartId: map[ColumnNote.chartId] as int,
      edited:
          DateTime.fromMillisecondsSinceEpoch(map[ColumnNote.edited] as int),
      storageState:
          map[columnState] == null ? null : map[columnState] as String,
      syncStatus: map[columnSyncStatus] == null
          ? null
          : map[columnSyncStatus] as String,
    );
  }

  static NoteModel fromEntity(Note entity) {
    return NoteModel(
      entity.id,
      title: entity.title,
      content: entity.content,
      edited: entity.edited,
      chartId: entity.chartId,
      storageState: entity.storageState,
      syncStatus: entity.syncStatus,
    );
  }

  @override
  String get docId => id.toString();

  @override
  int get primaryKey => id;
}
