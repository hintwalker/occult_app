import 'package:flutter/material.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_ui/tauari_ui.dart';

class NoteEditorScaffold<T> extends StatelessWidget {
  const NoteEditorScaffold({
    super.key,
    required this.note,
    required this.colorScheme,
    required this.translate,
    required this.child,
    required this.chartAvatar,
    required this.uid,
    required this.syncStatus,
    required this.onOpenSyncOptions,
  });
  final String? uid;
  final String? syncStatus;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final NoteLike<T> note;
  final Widget child;
  final Widget Function(NoteLike<T> note) chartAvatar;
  final void Function(BuildContext context) onOpenSyncOptions;

  @override
  Widget build(BuildContext context) {
    return
        // Material(
        //     child:
        //   SafeArea(
        // child:
        Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        BasicTopBar(
          title: chartAvatar(note),
          colorScheme: colorScheme,
          actions: [
            SyncStatusRibbonWidget(
                uid: uid,
                syncStatus: syncStatus,
                colorScheme: colorScheme,
                onTap: () => onOpenSyncOptions(context))
          ],
        ),
        // Row(
        //   children: [
        //     IconButton(
        //       onPressed: () => Navigator.maybePop(context),
        //       icon: const Icon(Icons.arrow_back),
        //     ),
        //     const SizedBox(width: 8.0),
        //     Expanded(
        //       child: chartAvatar(note),
        //     ),
        //   ],
        // ),
        Expanded(child: child),
      ],
      // ),
      // ),
    );
  }
}
