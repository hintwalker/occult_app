// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lasotuvi_provider/lasotuvi_provider.dart';
// import 'package:lasotuvi_request/lasotuvi_request.dart';
// import 'package:lasotuvi_style/lasotuvi_style.dart';
// import 'package:tauari_sort/tauari_sort.dart';
// import 'package:tauari_translate/tauari_translate.dart';
// import 'package:tauari_ui/tauari_ui.dart';
// import 'package:tuvi_admin_presentation/src/features/auth/admin_auth_depended_state.dart';
// import 'package:tuvi_admin_presentation/src/features/request/navigation/request_navigation.dart';

// class HomeScreenBody extends ConsumerStatefulWidget {
//   const HomeScreenBody({super.key});

//   @override
//   ConsumerState<HomeScreenBody> createState() => _HomeScreenBodyState();
// }

// class _HomeScreenBodyState extends AdminAuthDependedState<HomeScreenBody> {
//   @override
//   Widget build(BuildContext context) {
//     return findingUid
//         ? const LoadingWidget()
//         : BasicStreamBuilder(
//             stream: ref.watch(requestListControllerProvider).stream(uid),
//             child: (data) => BasicFutureBuilder(
//                   future: SortHelper.getSortOption(requestSortKey),
//                   child: (sortValue) => AllRequestListWidget(
//                     uid: uid,
//                     data: data ?? [],
//                     colorScheme: LasotuviAppStyle.colorScheme,
//                     translate: translate,
//                     onItemTap: (context, request, uid) =>
//                         RequestNavigation.openRequestView(
//                             context: context, request: request),
//                     // onOpenSyncStatus: ({required request, uid}) {},
//                     initSortValue: sortValue,
//                     onSaveSortOption: (String key, SortValue sortValue) =>
//                         SortHelper.saveSortOption(requestSortKey, sortValue),
//                   ),
//                 ));
//   }
// }
