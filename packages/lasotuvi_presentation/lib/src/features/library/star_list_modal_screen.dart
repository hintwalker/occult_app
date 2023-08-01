import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import 'package:lasotuvi_presentation/src/features/library/navigation/library_navigation.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_sort/tauari_sort.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

class StarListModalScreen extends ConsumerWidget {
  const StarListModalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StarListModal(
      colorScheme: LasotuviAppStyle.colorScheme,
      translate: translate,
      child: BasicFutureBuilder(
        future: ref.watch(starListControllerProvider).allData(),
        child: (data) => BasicFutureBuilder(
          future: SortHelper.getSortOption(starSortKey),
          child: (sortValue) => StarListWidget(
            data: data ?? [],
            onItemTap: (item) =>
                LibraryNavigation.showStarInfoViewer(context, item),
            translate: translate,
            colorScheme: LasotuviAppStyle.colorScheme,
            onSaveSortOption: SortHelper.saveSortOption,
            initSortValue: sortValue,
          ),
        ),
      ),
    );
  }
}
