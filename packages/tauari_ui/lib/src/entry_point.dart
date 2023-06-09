import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EntryPoint extends StatelessWidget {
  final Widget child;
  final String translationPath;
  final List<Locale> supportedLocales;
  final Locale startLocale;
  const EntryPoint({
    super.key,
    required this.child,
    required this.translationPath,
    required this.supportedLocales,
    required this.startLocale,
  });

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
      restorationId: 'root',
      child: EasyLocalization(
        supportedLocales: supportedLocales,
        path: translationPath,
        fallbackLocale: const Locale('vi'),
        startLocale: startLocale,
        child: child,
      ),
    );
  }
}
