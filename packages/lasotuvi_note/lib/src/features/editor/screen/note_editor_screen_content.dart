// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lasotuvi_note/src/features/editor/notifier/note_editor_notifier.dart';
// import 'package:lasotuvi_note/src/features/editor/state/note_editor_state.dart';
// import 'package:note_editor/note_editor.dart';
// import 'package:tauari_ui/tauari_ui.dart';

// class NoteEditorScreenContent extends ConsumerWidget {
//   const NoteEditorScreenContent({super.key, required this.state,});
//   final NoteEditorState state;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return state.workingState == NoteEditorWorkingState.initial 
//     || state.workingState == NoteEditorWorkingState.loading ?
//     const LoadingWidget()
//     : state.note == null ? const ErrorTextWidget()
//     : NoteEditorWidget(translate: translate, 
//     colorScheme: colorScheme, 
//     note: state.note!, 
//     onChanged: onChanged, 
//     onSave: onSave, 
//     toggleEditMode: (value) => ref.read, 
//     onHitMaxLength: onHitMaxLength,
//     );
//   }
// }
