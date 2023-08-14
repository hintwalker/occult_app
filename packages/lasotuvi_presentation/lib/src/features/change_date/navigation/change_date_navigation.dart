import 'package:flutter/material.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
import '../widget/change_date_modal_screen.dart';

class ChangeDateNavigation {
  static void showChangeDateModalScreen(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const ChangeDateModalScreen(),
        routeSettings: const RouteSettings(name: RouteName.changeDate));
  }
}
