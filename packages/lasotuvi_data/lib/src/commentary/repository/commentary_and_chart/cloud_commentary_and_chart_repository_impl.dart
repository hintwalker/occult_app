import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/commentary_model.dart';

class CloudCommentaryAndChartRepositoryImpl
    extends CloudDependentRepositoryImpl<Commentary, CommentaryModel, Chart>
    implements CloudCommentaryAndChartRepository {
  CloudCommentaryAndChartRepositoryImpl(
    super.dataSource, {
    required super.ownerRepository,
  }) : super(
          ownerIdColumn: ColumnCommentary.chartId,
          entityToModel: (entity) => CommentaryModel.fromEntity(entity),
        );

  @override
  int getOwnerId(Commentary entity) => entity.chartId;
}
