import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/chart_tag_model.dart';

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
