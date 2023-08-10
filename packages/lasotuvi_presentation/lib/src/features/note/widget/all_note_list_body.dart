import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_note_shared/lasotuvi_note_shared.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_sort/tauari_sort.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../../shared/widget/new_data_option_button.dart';

class AllNoteListBody extends ConsumerStatefulWidget {
  const AllNoteListBody({super.key});

  @override
  ConsumerState<AllNoteListBody> createState() => _AllNoteListBodyState();
}

class _AllNoteListBodyState extends UserAuthDependedState<AllNoteListBody> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        ref.read(mainDrawerControllerProvider).setScreenId(DrawerIds.home);
        return Future.value(false);
      },
      child: Stack(
        children: [
          findingUid
              ? const LoadingWidget()
              : BasicStreamBuilder(
                  stream:
                      ref.watch(noteAndChartListControllerProvider).stream(uid),
                  child: (data) => BasicFutureBuilder(
                    future: SortHelper.getSortOption(noteAndChartSortKey),
                    child: (sortValue) => AllNoteAndChartListWidget(
                      uid: uid,
                      data: data ?? [],
                      translate: translate,
                      colorScheme: LasotuviAppStyle.colorScheme,
                      onOpenSyncStatus: ({
                        required Note note,
                        required String? uid,
                      }) =>
                          onOpenSyncStatus(
                              context: context, note: note, uid: uid, ref: ref),
                      onItemTap: onItemTap,
                      onSaveSortOption: (key, value) =>
                          SortHelper.saveSortOption(key, value),
                      initSortValue: sortValue,
                    ),
                  ),
                ),
          const NewDataOptionButton(),
        ],
      ),
    );
  }

  void onItemTap(BuildContext context, Note note, String? uid) {
    NoteNavigation.openNoteEditorScreen(context, note);
  }

  void onOpenSyncStatus({
    required BuildContext context,
    required Note note,
    required String? uid,
    required WidgetRef ref,
  }) {
    StorageHelper.showOptionsModal<Note>(
      note,
      context: context,
      uid: uid,
      ref: ref,
    );
  }
}
