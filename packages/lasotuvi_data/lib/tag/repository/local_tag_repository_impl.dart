part of lasotuvi_data;

class LocalTagRepositoryImpl extends LocalRepositoryImpl<Tag, TagModel>
    implements LocalTagRepository {
  LocalTagRepositoryImpl(super.dataSource)
      : super(entityToModel: (entity) => TagModel.fromEntity(entity));
}
