part of lasotuvi_data;

class CloudTagRepositoryImpl extends CloudRepositoryImpl<Tag, TagModel>
    implements CloudTagRepository {
  CloudTagRepositoryImpl(super.dataSource)
      : super(entityToModel: (entity) => TagModel.fromEntity(entity));
}
