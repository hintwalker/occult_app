import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_note/src/features/editor/state/note_editor_state.dart';
import 'package:tauari_auth/tauari_auth.dart';

class NoteEditorNotifier extends StateNotifier<NoteEditorState> {
  NoteEditorNotifier({
    required this.takeNoteById,
    required this.takeCurrentUser,
    required this.takeChartByNoteId,
  }) : super(const NoteEditorState.initial());

  final TakeNoteById takeNoteById;
  final TakeCurrentUser takeCurrentUser;
  final ChartByNoteId takeChartByNoteId;

  Future<void> fetchData({
    required int noteId,
    required String? syncStatus,
  }) async {
    state = state.copyWith(
      workingState: NoteEditorWorkingState.loading,
    );
    final user = takeCurrentUser();
    final note = await takeNoteById.call(
      uid: user?.uidInFirestore,
      entityId: noteId,
      syncStatus: syncStatus,
    );
    final chart = note == null
        ? null
        : await takeChartByNoteId.call(
            uid: user?.uidInFirestore,
            dependentId: note.id,
          );
    state = state.copyWith(
      workingState: NoteEditorWorkingState.loaded,
      note: note,
      chart: chart,
    );
  }
}
