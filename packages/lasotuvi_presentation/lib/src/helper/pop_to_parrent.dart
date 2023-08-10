import 'package:flutter/material.dart';

void popToParrent(BuildContext context, String currentRoute) async {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (context.mounted) {
      Navigator.popUntil(context, (route) {
        return !(route.settings.name == null ||
            route.settings.name == currentRoute);
      });
    }
  });
  // Future.delayed(Duration.zero, () {});
}
