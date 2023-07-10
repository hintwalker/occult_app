import 'package:flutter/material.dart';

import '../../../shared/screen_app_bar.dart';

class ChartScreenAppBar extends StatelessWidget {
  const ChartScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenAppBar('',
        // actions: [EnergyPointAppBarAction()],
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ]);
  }
}
