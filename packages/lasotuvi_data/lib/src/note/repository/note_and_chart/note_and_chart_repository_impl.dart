import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/note_model.dart';

class NoteAndChartRepositoryImpl
    extends SyncableDependentRepositoryImpl<Note, NoteModel, Chart>
    implements NoteAndChartRepository {
  NoteAndChartRepositoryImpl(
      {required super.localDependentRepository,
      required super.cloudDependentRepository,
      required super.ownerRepository});
}
