import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';

class NoteEditorBodyController {
  const NoteEditorBodyController({
    required this.update,
  });
  final UpdateNote update;

  Future<void> save({
    required Note note,
    required String? uid,
  }) async {
    await update(
      uid,
      note,
      false,
    );
    // await ref.read(noteRepositoryProvider).update(note, uid);
  }

  Future<void> onChanged(Note note, WidgetRef ref, String? uid) async {
    ref
        .read(noteEditorCacheProvider)
        .whenData((value) async => await value.save(note));
  }
}
