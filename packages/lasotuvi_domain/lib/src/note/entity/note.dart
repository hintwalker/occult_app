import 'package:tauari_data_core/tauari_data_core.dart';

import '../column_note.dart';

class Note extends SyncableEntity<Note> {
  Note(
    super.id, {
    required this.title,
    required this.content,
    required this.created,
    required this.edited,
    required this.chartId,
    super.storageState,
    super.syncStatus,
  });
  final String title;
  final String content;
  final DateTime created;
  final DateTime edited;
  final int chartId;

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      map[columnId] as int,
      title:
          map[ColumnNote.title] == null ? '' : map[ColumnNote.title] as String,
      content: map[ColumnNote.content] as String,
      created: map[columnCreated] == null
          ? DateTime.fromMillisecondsSinceEpoch(map[columnId] as int)
          : DateTime.fromMillisecondsSinceEpoch(map[columnCreated] as int),
      edited: map[ColumnNote.edited] == null
          ? DateTime.fromMillisecondsSinceEpoch(map[columnId] as int)
          : DateTime.fromMillisecondsSinceEpoch(map[ColumnNote.edited] as int),
      chartId: map[ColumnNote.chartId] as int,
      storageState:
          map[columnState] == null ? null : map[columnState] as String,
      syncStatus: map[columnSyncStatus] == null
          ? null
          : map[columnSyncStatus] as String,
    );
  }

  @override
  Note copyWithSyncStatus(String? value) {
    return copyWith(syncStatus: value);
  }

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType ||
      other is Note && other.id == id;

  @override
  int get hashCode => id.hashCode;

  Note copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? created,
    DateTime? edited,
    String? syncStatus,
    int? chartId,
    String? storageState,
  }) {
    return Note(
      id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      created: created ?? this.created,
      edited: edited ?? this.edited,
      chartId: chartId ?? this.chartId,
      storageState: storageState ?? this.storageState,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  Note copyWithState(String? state) => copyWith(storageState: state);

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id,
      ColumnNote.title: title,
      ColumnNote.content: content,
      columnCreated: created.millisecondsSinceEpoch,
      ColumnNote.edited: edited.millisecondsSinceEpoch,
      ColumnNote.chartId: chartId,
      columnState: storageState,
      columnSyncStatus: syncStatus
    };
  }
}
