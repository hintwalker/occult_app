import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart' show Tag;
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:lasotuvi_tag/lasotuvi_tag.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../helper/sort_helper.dart';

class AllTagListBody extends ConsumerStatefulWidget {
  const AllTagListBody({super.key});

  @override
  ConsumerState<AllTagListBody> createState() => _AllTagListBodyState();
}

class _AllTagListBodyState extends AuthDependedState<AllTagListBody> {
  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const Center(child: LoadingWidget())
        : BasicStreamBuilder(
            stream: ref.watch(tagListControllerProvider).stream(uid),
            child: (data) => BasicFutureBuilder(
              future: SortHelper.getSortOption(tagSortKey),
              child: (sortValue) => AllTagListWidget(
                data: data,
                uid: uid,
                translate: translate,
                colorScheme: LasotuviAppStyle.colorScheme,
                onItemTap: onItemTap,
                onOpenSyncStatus: ({required tag, required uid}) =>
                    StorageHelper.showOptionsModal<Tag>(
                  tag,
                  context: context,
                  uid: uid,
                  ref: ref,
                ),
                onSaveSortOption: (key, value) =>
                    SortHelper.saveSortOption(key, value),
                initSortValue: sortValue,
              ),
            ),
          );
  }

  void onItemTap(BuildContext context, Tag tag, String? uid) {
    TagHelper.openTagDetail(context: context, tag: tag);
    // context.pushNamed(RouteName.chartView, pathParameters: {
    //   RouterParams.chartId: chart.id.toString(),
    //   RouterParams.uid: uid ?? RouterParams.nullValue
    // });
  }
}
