import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import 'package:lasotuvi_presentation/src/features/auth/user_auth_depended_state.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

class BookReaderModalScreen extends ConsumerStatefulWidget {
  const BookReaderModalScreen(this.item, {super.key});
  final BookItem item;

  @override
  ConsumerState<BookReaderModalScreen> createState() =>
      _BookReaderModalScreenState();
}

class _BookReaderModalScreenState
    extends UserAuthDependedState<BookReaderModalScreen> {
  @override
  Widget build(BuildContext context) {
    return BookReaderModal(
      title: translate(widget.item.label),
      colorScheme: LasotuviAppStyle.colorScheme,
      child: findingUid
          ? const LoadingWidget()
          : BookReader(
              uid: uid!,
              controller: ref.watch(bookReaderControllerProvider),
              item: widget.item,
            ),
    );
  }
}
