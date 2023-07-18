import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../auth/auth_depended_state.dart';

class StarInfoBody extends ConsumerStatefulWidget {
  const StarInfoBody(this.item, {super.key});
  final StarItem item;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StarInfoBodyState();
}

class _StarInfoBodyState extends AuthDependedState<StarInfoBody> {
  @override
  Widget build(BuildContext context) {
    return StarInfoModal(
      title: translate(widget.item.label),
      colorScheme: LasotuviAppStyle.colorScheme,
      child: findingUid
          ? const LoadingWidget()
          : uid == null
              ? const Center(
                  child: NeedSignInAlertDialog(
                    colorScheme: LasotuviAppStyle.colorScheme,
                    translate: translate,
                  ),
                )
              : StarInfoViewer(
                  widget.item.name,
                  uid: uid!,
                  controller: ref.watch(starInfoViewerControllerProvider),
                  colorScheme: LasotuviAppStyle.colorScheme,
                ),
    );
  }
}
