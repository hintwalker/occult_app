part of lasotuvi_presentation;

class NoteEditorBodyController {
  const NoteEditorBodyController({
    required this.update,
  });
  final UpdateNote update;

  Future<void> save({
    required Note note,
    required String? uid,
  }) async {
    await update(uid, note);
    // await ref.read(noteRepositoryProvider).update(note, uid);
  }

  Future<void> onChanged(Note note, WidgetRef ref, String? uid) async {
    ref
        .read(noteEditorCacheProvider)
        .whenData((value) async => await value.save(note));
  }
}
