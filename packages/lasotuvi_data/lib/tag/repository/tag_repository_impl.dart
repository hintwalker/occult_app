part of lasotuvi_data;

class TagRepositoryImpl extends SyncableRepositoryImpl<Tag, TagModel>
    implements TagRepository {
  TagRepositoryImpl({
    required super.localRepository,
    required super.cloudRepository,
  });
}
