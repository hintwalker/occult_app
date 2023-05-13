part of lasotuvi_data;

class CloudTagRepositoryImpl extends CloudRepositoryImpl<Tag, TagModel> {
  CloudTagRepositoryImpl(super.dataSource)
      : super(entityToModel: (entity) => TagModel.fromEntity(entity));
}
