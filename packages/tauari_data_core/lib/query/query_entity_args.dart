part of tauari_data_core;

class QueryEntityArgs {
  final int entityId;
  final String? uid;

  final int? secondEntityId;
  const QueryEntityArgs({
    required this.entityId,
    this.uid,
    this.secondEntityId,
  });
  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is QueryEntityArgs &&
          runtimeType == other.runtimeType &&
          entityId == other.entityId &&
          uid == other.uid;

  @override
  int get hashCode => Object.hash(entityId, uid);
}
