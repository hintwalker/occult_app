import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/commentary_model.dart';

class CloudCommentaryAndRequestRepositoryImpl
    extends CloudDependentRepositoryImpl<Commentary, CommentaryModel, Request>
    implements CloudCommentaryAndRequestRepository {
  CloudCommentaryAndRequestRepositoryImpl(
    super.dataSource, {
    required super.ownerRepository,
  }) : super(
          ownerIdColumn: ColumnCommentary.requestId,
          entityToModel: (entity) => CommentaryModel.fromEntity(entity),
        );

  @override
  int getOwnerId(Commentary entity) => entity.requestId;
}
