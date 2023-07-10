import '../entity/syncable_entity.dart';
import 'cloud_model.dart';
import 'local_model.dart';

abstract class SyncableModel<E extends SyncableEntity>
    implements LocalModel<E>, CloudModel<E> {
  const SyncableModel(this.id, {this.syncStatus, this.storageState});
  final int id;
  final String? syncStatus;
  final String? storageState;
}
