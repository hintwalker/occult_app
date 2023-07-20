import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/commentary_model.dart';

class CommentaryAndRequestRepositoryImpl
    extends SyncableDependentRepositoryImpl<Commentary, CommentaryModel,
        Request> implements CommentaryAndRequestRepository {
  CommentaryAndRequestRepositoryImpl(
      {required super.localDependentRepository,
      required super.cloudDependentRepository,
      required super.ownerRepository});
}
