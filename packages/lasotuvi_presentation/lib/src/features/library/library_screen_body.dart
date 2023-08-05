import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import 'package:lasotuvi_presentation/src/features/navigation/drawer_ids.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'navigation/library_navigation.dart';

import '../auth/user_auth_depended_state.dart';

class LibraryScreenBody extends ConsumerStatefulWidget {
  const LibraryScreenBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LibraryBodyState();
}

class _LibraryBodyState extends UserAuthDependedState<LibraryScreenBody> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        ref.read(mainDrawerControllerProvider).setScreenId(DrawerIds.home);
        return Future.value(false);
      },
      child: LibraryWidget(
        onOpenStarsSceen: () => LibraryNavigation.showStarsScreen(context),
        onOpenBooksScreen: () => LibraryNavigation.showBooksScreen(context),
      ),
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
