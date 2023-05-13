part of tauari_data_core;

class SyncableEntityCarrier<S extends SyncableEntity,
    E extends SyncableEntity> {
  final S source;
  final Iterable<E> carry;

  const SyncableEntityCarrier({
    required this.source,
    required this.carry,
  });
}
