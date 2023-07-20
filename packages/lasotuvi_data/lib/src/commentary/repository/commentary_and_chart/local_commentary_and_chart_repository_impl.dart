import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/commentary_model.dart';

class LocalCommentaryAndChartRepositoryImpl
    extends LocalDependentRepositoryImpl<Commentary, CommentaryModel, Chart>
    implements LocalCommentaryAndChartRepository {
  LocalCommentaryAndChartRepositoryImpl(
    super.dataSource, {
    required super.ownerRepository,
  }) : super(
          ownerIdColumn: ColumnCommentary.requestId,
          entityToModel: (entity) => CommentaryModel.fromEntity(entity),
        );

  @override
  int getOwnerId(Commentary entity) => entity.chartId;
}
