import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import 'navigation/library_navigation.dart';

import '../auth/auth_depended_state.dart';

class LibraryScreenBody extends ConsumerStatefulWidget {
  const LibraryScreenBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LibraryBodyState();
}

class _LibraryBodyState extends AuthDependedState<LibraryScreenBody> {
  @override
  Widget build(BuildContext context) {
    return LibraryWidget(
      onOpenStarsSceen: () => LibraryNavigation.showStarsScreen(context),
      onOpenBooksScreen: () => LibraryNavigation.showBooksScreen(context),
    );
    // findingUid
    //     ? const Center(
    //         child: LoadingWidget(),
    //       )
    //     : uid == null
    //         ? const Center(
    //             child: NeedSignInAlertDialog(
    //               colorScheme: LasotuviAppStyle.colorScheme,
    //               translate: translate,
    //             ),
    //           )
    //         : StarInfoViewer(
    //             'tu_vi',
    //             uid: uid!,
    //             controller: ref.watch(starInfoViewerControllerProvider),
    //             colorScheme: LasotuviAppStyle.colorScheme,
    //           );
  }
}
