part of lasotuvi_data;

class ChartTagRepositoryImpl
    extends SyncableRelRepositoryImpl<ChartTag, ChartTagModel, Chart, Tag>
    implements ChartTagRepository {
  // final ChartRepository chartRepository;
  // final TagRepository tagRepository;
  ChartTagRepositoryImpl({
    required super.localRelRepository,
    required super.cloudRelRepository,
    required super.leftRepository,
    required super.rightRepository,
  });
}
