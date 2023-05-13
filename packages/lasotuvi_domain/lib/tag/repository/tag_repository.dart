part of lasotuvi_domain;

abstract class TagRepository extends SyncableRepository<Tag> {
  TagRepository(
      {required super.localRepository, required super.cloudRepository});
}
