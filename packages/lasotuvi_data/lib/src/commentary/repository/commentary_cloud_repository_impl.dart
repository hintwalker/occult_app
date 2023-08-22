import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/commentary_model.dart';

class CommentaryCloudRepositoryImpl
    extends CloudDependentRepositoryImpl<Commentary, CommentaryModel, Chart>
    implements CloudCommentaryRepository {
  CommentaryCloudRepositoryImpl(
    super.cacheDataSource, {
    required super.onlineDataSource,
    required super.ownerIdColumn,
    required super.ownerRepository,
    required super.entityToModel,
  });

  @override
  int getOwnerId(Commentary entity) => entity.requestId;
}
