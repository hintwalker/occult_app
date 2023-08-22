import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/commentary_model.dart';

class CommentaryLocalRepositoryImpl
    extends LocalDependentRepositoryImpl<Commentary, CommentaryModel, Chart>
    implements LocalCommentaryRepository {
  CommentaryLocalRepositoryImpl(super.dataSource,
      {required super.ownerIdColumn,
      required super.ownerRepository,
      required super.entityToModel});

  @override
  int getOwnerId(Commentary entity) => entity.requestId;
}
