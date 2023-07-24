import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_commentary/lasotuvi_commentary.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_sort/tauari_sort.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
import '../navigation/commentary_navigation.dart';

class AllCommentaryListBody extends ConsumerStatefulWidget {
  const AllCommentaryListBody({super.key});

  @override
  ConsumerState<AllCommentaryListBody> createState() =>
      _AllCommentaryListBodyState();
}

class _AllCommentaryListBodyState
    extends UserAuthDependedState<AllCommentaryListBody> {
  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const LoadingWidget()
        : BasicStreamBuilder(
            stream: ref
                .watch(commentaryAndRequestListControllerProvider)
                .stream(uid),
            child: (data) => BasicFutureBuilder(
              future: SortHelper.getSortOption(commentaryAndRequestSortKey),
              child: (sortValue) => AllCommentaryAndRequestListWidget(
                uid: uid,
                data: data,
                translate: translate,
                colorScheme: LasotuviAppStyle.colorScheme,
                onOpenSyncStatus: ({
                  required Commentary commentary,
                  required String? uid,
                }) =>
                    onOpenSyncStatus(
                        context: context,
                        commentary: commentary,
                        uid: uid,
                        ref: ref),
                onItemTap: onItemTap,
                onSaveSortOption: (key, value) =>
                    SortHelper.saveSortOption(key, value),
                initSortValue: sortValue,
              ),
            ),
          );
  }

  void onItemTap(BuildContext context, Commentary commentary, String? uid) {
    CommentaryNavigation.openCommentaryReaderScreen(context, commentary);
  }

  void onOpenSyncStatus({
    required BuildContext context,
    required Commentary commentary,
    required String? uid,
    required WidgetRef ref,
  }) {
    StorageHelper.showOptionsModal<Commentary>(
      commentary,
      context: context,
      uid: uid,
      ref: ref,
    );
  }
}
