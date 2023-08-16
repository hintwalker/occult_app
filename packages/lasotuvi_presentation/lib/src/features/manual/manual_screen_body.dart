import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_manual/lasotuvi_manual.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';

import '../navigation/drawer_ids.dart';

class ManualScreenBody extends ConsumerWidget {
  const ManualScreenBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
        onWillPop: () {
          ref.read(mainDrawerControllerProvider).setScreenId(DrawerIds.home);
          return Future.value(false);
        },
        child: const ManualScreenContent(
          colorScheme: LasotuviAppStyle.colorScheme,
        ));
  }
}
