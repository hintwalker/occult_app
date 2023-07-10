import 'syncable_entity.dart';

class SyncableEntityPair<A extends SyncableEntity, B extends SyncableEntity> {
  final A? entity1;
  final B? entity2;

  const SyncableEntityPair(this.entity1, this.entity2);
}
