import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/commentary_model.dart';

class CommentaryAndChartRepositoryImpl
    extends SyncableDependentRepositoryImpl<Commentary, CommentaryModel, Chart>
    implements CommentaryAndChartRepository {
  CommentaryAndChartRepositoryImpl(
      {required super.localDependentRepository,
      required super.cloudDependentRepository,
      required super.ownerRepository});
}
