import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_note_shared/lasotuvi_note_shared.dart';

import '../usecase/on_count_note.dart';

final countNoteEveryWhereControllerProvider =
    ChangeNotifierProvider.autoDispose<CountNoteEveryWhereController>(
  (ref) => CountNoteEveryWhereController(
    ref.read(onCountNoteProvider),
  ),
);
