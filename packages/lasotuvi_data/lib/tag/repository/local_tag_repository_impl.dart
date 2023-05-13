part of lasotuvi_data;

class LocalTagRepositoryImpl extends LocalRepositoryImpl<Tag, TagModel> {
  LocalTagRepositoryImpl(super.dataSource)
      : super(entityToModel: (entity) => TagModel.fromEntity(entity));
}
