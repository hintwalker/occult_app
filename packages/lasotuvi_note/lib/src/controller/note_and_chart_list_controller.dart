import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

class NoteAndChartListController
    extends SyncablePairDataListStreamController<Note, Chart, NoteAndChart> {
  NoteAndChartListController({required OnNoteAndChart onData})
      : super(onSyncableData: onData);
}
