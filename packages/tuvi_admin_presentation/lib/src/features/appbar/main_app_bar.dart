import 'package:flutter/material.dart';
import 'package:tauari_translate/tauari_translate.dart';

import '../dashboard/widget/custom_search_delegate.dart';
import 'auth_section.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const AuthSection(),
      title: Text(
        translate("tuviAdmin"),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // method to show the search bar
            showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: CustomSearchDelegate());
          },
          icon: const Icon(Icons.search),
        )
      ],
    );
  }

  @override
  final Size preferredSize;
}
