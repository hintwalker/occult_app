import 'cloud_getable.dart';
import 'entity.dart';
import 'sqlite_getable.dart';
import 'statable.dart';
import 'syncable.dart';

abstract class SyncableEntity<T> extends Entity
    implements Syncable<T>, CloudGetable, SqliteGetable, Statable<T> {
  const SyncableEntity(this.id, {this.syncStatus, this.storageState});
  final int id;
  final String? syncStatus;
  final String? storageState;

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
}
