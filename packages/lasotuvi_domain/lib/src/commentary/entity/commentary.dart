import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_values/tauari_values.dart';

import '../column_commentary.dart';

class Commentary extends MustBuyEntity<Commentary>
    implements NoteLike<Commentary> {
  Commentary(
    super.id, {
    required this.title,
    required this.content,
    required this.created,
    required this.lastViewed,
    required this.requestId,
    super.storageState,
    super.syncStatus,
    required super.price,
    required super.paid,
    required super.modified,
    super.uploadDate,
  });
  final String title;
  final String content;
  final DateTime created;
  final DateTime lastViewed;
  final int requestId;

  @override
  Commentary copyWithState(String? state) => copyWith(storageState: state);

  @override
  Commentary copyWithSyncStatus(String? value) => copyWith(syncStatus: value);

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id,
      ColumnCommentary.title: title,
      ColumnCommentary.content: content,
      columnCreated: created.millisecondsSinceEpoch,
      ColumnCommentary.lastViewed: lastViewed.millisecondsSinceEpoch,
      ColumnCommentary.requestId: requestId,
      columnState: storageState,
      columnSyncStatus: syncStatus,
      columnPrice: price,
      columnPaid: paid,
      columnModified: modified,
      columnUploadDate: uploadDate?.millisecondsSinceEpoch,
    };
  }

  factory Commentary.fromMap(Map<String, dynamic> map) {
    return Commentary(
      map[columnId] as int,
      title: map[ColumnCommentary.title] == null
          ? ''
          : map[ColumnCommentary.title] as String,
      content: map[ColumnCommentary.content] as String,
      created: map[columnCreated] == null
          ? DateTime.fromMillisecondsSinceEpoch(map[columnId] as int)
          : DateTime.fromMillisecondsSinceEpoch(map[columnCreated] as int),
      lastViewed: map[ColumnCommentary.lastViewed] == null
          ? DateTime.fromMillisecondsSinceEpoch(map[columnId] as int)
          : DateTime.fromMillisecondsSinceEpoch(
              map[ColumnCommentary.lastViewed] as int),
      requestId: map[ColumnCommentary.requestId] as int,
      storageState:
          map[columnState] == null ? null : map[columnState] as String,
      syncStatus: map[columnSyncStatus] == null
          ? null
          : map[columnSyncStatus] as String,
      price: map[columnPrice] == null ? 0 : map[columnPrice] as int,
      paid: map[columnPaid] == null ? PaidValue.unPaid : map[columnPaid] as int,
      modified: map[columnModified] == null
          ? LocalLocked.unlocked
          : map[columnModified] as int,
      uploadDate: map[columnUploadDate] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(
              map[columnUploadDate] as int,
            ),
    );
  }

  Commentary copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? created,
    DateTime? lastViewed,
    String? syncStatus,
    int? requestId,
    String? storageState,
    int? price,
    int? paid,
    int? modified,
    DateTime? uploadDate,
  }) {
    return Commentary(
      id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      created: created ?? this.created,
      lastViewed: lastViewed ?? this.lastViewed,
      requestId: requestId ?? this.requestId,
      storageState: storageState ?? this.storageState,
      syncStatus: syncStatus ?? this.syncStatus,
      price: price ?? this.price,
      paid: paid ?? this.paid,
      modified: modified ?? this.modified,
      uploadDate: uploadDate ?? this.uploadDate,
    );
  }

  @override
  Commentary copyWithPaid(int value) => copyWith(paid: value);

  @override
  Commentary copyWithPrice(int value) => copyWith(price: value);

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType && other is Commentary && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  Commentary copyWithContent(String content) => copyWith(content: content);

  @override
  Commentary copyWithTitle(String title) => copyWith(title: title);

  @override
  int get noteId => id;

  @override
  Commentary coppyWithTitleAndContent({
    required String title,
    required String content,
    DateTime? time,
  }) =>
      copyWith(
        title: title,
        content: content,
      );

  @override
  String get noteContent => content;

  @override
  String get noteTitle => title;

  @override
  Commentary get data => this;

  @override
  Commentary copyWithModified(int value) => copyWith(modified: value);

  @override
  String? get noteSyncStatus => syncStatus;

  @override
  Commentary copyWithUploadDate(DateTime? value) => copyWith(uploadDate: value);
}
