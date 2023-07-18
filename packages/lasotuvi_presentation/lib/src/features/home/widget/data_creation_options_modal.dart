import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../chart/navigation/chart_navigation.dart';
import '../../note/navigation/note_navigation.dart';
import '../../tag/navigation/tag_navigation.dart';

class DataCreationOptionsModal extends ConsumerWidget {
  const DataCreationOptionsModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasicBottomSheet(
      title: translate('addNewData'),
      colorScheme: LasotuviAppStyle.colorScheme,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...ListTile.divideTiles(
              context: context,
              tiles: [
                ListTile(
                  leading: const Icon(Icons.badge_outlined),
                  title: Text(translate('addNewChart')),
                  onTap: () {
                    context.pop();
                    ChartNavigation.openChartCreationScreen(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.label),
                  title: Text(translate('addNewTag')),
                  onTap: () {
                    context.pop();
                    TagNavigation.openTagCreationScreen(
                      context,
                      (tag) => TagNavigation.openTagDetail(
                          context: context, tag: tag),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.sticky_note_2_outlined),
                  title: Text(translate('addNewNote')),
                  onTap: () {
                    context.pop();
                    NoteNavigation.openChartSelectionScreen(context, ref);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
