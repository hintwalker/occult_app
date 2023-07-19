import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart' show Commentary;
import 'package:tauari_ui/tauari_ui.dart';

import 'commentary_item_widget.dart';

class CommentaryGridWidget extends StatelessWidget {
  const CommentaryGridWidget({
    super.key,
    required this.uid,
    required this.data,
    required this.colorScheme,
    required this.translate,
    // required this.onOpenCommentaryCreation,
    required this.onOpenCommentaryReader,
    required this.onOpenSyncOptions,
  });
  final String? uid;
  final Iterable<Commentary> data;
  final ColorScheme colorScheme;
  final String Function(String) translate;

  final void Function(BuildContext context, Commentary commentary)
      onOpenSyncOptions;
  // final void Function(BuildContext context) onOpenCommentaryCreation;
  final void Function(BuildContext context, Commentary commentary)
      onOpenCommentaryReader;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Text(
            '${translate('commentary')} (${data.length})',
            style: TextStyle(fontSize: 22.0, color: colorScheme.primary),
          ),
          // const SizedBox(width: 12.0),
          // ElevatedButton.icon(
          //   onPressed: () => onOpenCommentaryCreation(context),
          //   icon: const Icon(Icons.add_circle_outline),
          //   label: Text(
          //     translate('addCommentary'),
          //   ),
          // ),
        ]),
        DataGridWidget<Commentary>(
          data,
          itemWidget: (commentary) => CommentaryItemWidget(commentary,
              uid: uid,
              colorScheme: colorScheme,
              onSyncStatusTap: () => onOpenSyncOptions(context, commentary),
              onTap: onOpenCommentaryReader),
        ),
      ],
    );
  }
}
