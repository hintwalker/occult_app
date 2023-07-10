import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/note_model.dart';

class LocalNoteAndChartRepositoryImpl
    extends LocalDependentRepositoryImpl<Note, NoteModel, Chart>
    implements LocalNoteAndChartRepository {
  LocalNoteAndChartRepositoryImpl(
    super.dataSource, {
    required super.ownerRepository,
  }) : super(
          ownerIdColumn: ColumnNote.chartId,
          entityToModel: (entity) => NoteModel.fromEntity(entity),
        );

  @override
  int getOwnerId(Note entity) => entity.chartId;
}
