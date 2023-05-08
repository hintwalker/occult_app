part of tauari_data_core;

abstract class SyncableModel<M, E extends SyncableEntity>
    implements LocalModel<E>, CloudModel<E> {
  const SyncableModel();
}
