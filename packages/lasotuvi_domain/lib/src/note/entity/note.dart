import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_values/tauari_values.dart';

import '../../old_version_data/structure/old_note_columns.dart';
import '../column_note.dart';

class Note extends SyncableEntity<Note> implements NoteLike<Note> {
  Note(
    super.id, {
    required this.title,
    required this.content,
    required this.created,
    required this.edited,
    required this.chartId,
    super.storageState,
    super.syncStatus,
    required super.modified,
  });
  final String title;
  final String content;
  final DateTime created;
  final DateTime edited;
  final int chartId;

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(map[columnId] as int,
        title: map[ColumnNote.title] == null
            ? ''
            : map[ColumnNote.title] as String,
        content: map[ColumnNote.content] as String,
        created: map[columnCreated] == null
            ? DateTime.fromMillisecondsSinceEpoch(map[columnId] as int)
            : DateTime.fromMillisecondsSinceEpoch(map[columnCreated] as int),
        edited: map[ColumnNote.edited] == null
            ? DateTime.fromMillisecondsSinceEpoch(map[columnId] as int)
            : DateTime.fromMillisecondsSinceEpoch(
                map[ColumnNote.edited] as int),
        chartId: map[ColumnNote.chartId] as int,
        storageState:
            map[columnState] == null ? null : map[columnState] as String,
        syncStatus: map[columnSyncStatus] == null
            ? null
            : map[columnSyncStatus] as String,
        modified: map[columnModified] == null
            ? LocalLocked.unlocked
            : map[columnModified] as int);
  }

  static Note fromOldVersion(Map<String, Object?> map) {
    return Note(
      map[OldNoteColumns.createdDate] as int,
      title: map[OldNoteColumns.noteTitle] == null
          ? ''
          : map[OldNoteColumns.noteTitle] as String,
      content: '[{"insert":"${map[OldNoteColumns.noteText]}\\n"}]',
      created: DateTime.fromMillisecondsSinceEpoch(
          map[OldNoteColumns.createdDate] as int),
      edited: DateTime.fromMillisecondsSinceEpoch(
          map[OldNoteColumns.lastUpdated] as int),
      chartId: map[OldNoteColumns.humanId] as int,
      storageState: null,
      syncStatus: null,
      modified: LocalLocked.unlocked,
    );
  }

  @override
  Note copyWithSyncStatus(String? value) {
    return copyWith(syncStatus: value);
  }

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType && other is Note && other.id == id;

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
    int? modified,
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
      modified: modified ?? this.modified,
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
      columnSyncStatus: syncStatus,
      columnModified: modified,
    };
  }

  @override
  Note copyWithContent(String content) => copyWith(content: content);

  @override
  Note copyWithTitle(String title) => copyWith(title: title);

  @override
  int get noteId => id;

  @override
  String get noteContent => content;

  @override
  String get noteTitle => title;

  @override
  Note coppyWithTitleAndContent({
    required String title,
    required String content,
    DateTime? time,
  }) =>
      copyWith(
        title: title,
        content: content,
        edited: time,
      );

  @override
  Note get data => this;

  @override
  Note copyWithModified(int value) => copyWith(modified: value);
}
