import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/note_model.dart';

class CloudNoteRepositoryImpl
    extends CloudDependentRepositoryImpl<Note, NoteModel, Chart>
    implements CloudNoteRepository {
  CloudNoteRepositoryImpl(
    super.cacheDataSource, {
    required super.onlineDataSource,
    required super.ownerIdColumn,
    required super.ownerRepository,
    required super.entityToModel,
  });

  @override
  int getOwnerId(Note entity) => entity.chartId;
}
