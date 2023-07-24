import 'cloud_getable.dart';
import 'entity.dart';
// import 'modifyable.dart';
import 'sqlite_getable.dart';
import 'statable.dart';
import 'syncable.dart';

abstract class SyncableEntity<T> extends Entity
    implements Syncable<T>, CloudGetable, SqliteGetable, Statable<T> {
  const SyncableEntity(
    this.id, {
    this.syncStatus,
    this.storageState,
    required this.modified,
  });
  final int id;
  final String? syncStatus;
  final String? storageState;

  final int modified;
  @override
  int get getModified => modified;
  @override
  int get syncId => id;

  @override
  int get primaryKey => id;

  @override
  String get docId => id.toString();

  @override
  String? get getSyncStatus => syncStatus;

  @override
  String? get state => storageState;

  @override
  String get sortId => docId;

  T copyWithModified(int value);
}
