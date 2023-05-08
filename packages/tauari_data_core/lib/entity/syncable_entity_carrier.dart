import 'package:tauari_data_core/tauari_data_core.dart';

class SyncableEntityCarrier<S extends SyncableEntity,
    E extends SyncableEntity> {
  final S source;
  final Iterable<E> carry;

  const SyncableEntityCarrier({
    required this.source,
    required this.carry,
  });
}
