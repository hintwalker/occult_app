import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import 'navigation/library_navigation.dart';

class BookListModalScreen extends ConsumerWidget {
  const BookListModalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BookListModal(
      colorScheme: LasotuviAppStyle.colorScheme,
      translate: translate,
      child: BasicFutureBuilder(
        future: ref.watch(bookListControllerProvider).allData(),
        child: (data) => BookListWidget(
          data: data,
          onItemTap: (item) => LibraryNavigation.showBookReader(context, item),
          translate: translate,
        ),
      ),
    );
  }
}
