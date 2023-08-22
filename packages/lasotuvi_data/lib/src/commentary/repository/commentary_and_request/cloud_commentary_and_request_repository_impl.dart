import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/commentary_model.dart';

class CloudCommentaryAndRequestRepositoryImpl
    extends CloudDependentRepositoryImpl<Commentary, CommentaryModel, Request>
    implements CloudCommentaryAndRequestRepository {
  CloudCommentaryAndRequestRepositoryImpl(
    super.cacheDataSource, {
    required super.ownerRepository,
    required super.onlineDataSource,
  }) : super(
          ownerIdColumn: ColumnCommentary.requestId,
          entityToModel: (entity) => CommentaryModel.fromEntity(entity),
        );

  @override
  int getOwnerId(Commentary entity) => entity.requestId;
}
