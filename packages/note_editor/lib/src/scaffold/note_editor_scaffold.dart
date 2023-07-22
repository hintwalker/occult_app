import 'package:flutter/material.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class NoteEditorScaffold<T> extends StatelessWidget {
  const NoteEditorScaffold({
    super.key,
    required this.note,
    required this.colorScheme,
    required this.translate,
    required this.child,
    required this.chartAvatar,
  });

  final ColorScheme colorScheme;
  final String Function(String) translate;
  final NoteLike<T> note;
  final Widget child;
  final Widget Function(NoteLike<T> note) chartAvatar;

  @override
  Widget build(BuildContext context) {
    return
        // Material(
        //     child:
        SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.maybePop(context),
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: chartAvatar(note),
              ),
            ],
          ),
          Expanded(child: child),
        ],
      ),
      // ),
    );
  }
}
