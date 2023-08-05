import 'package:flutter/material.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
    this.restorationId,
  });
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
        restorationId: restorationId,
        child: Container(
            decoration: BoxDecoration(
              color: LasotuviAppStyle.colorScheme.background,
            ),
            child: const SplashScreenBody()));
  }
}
