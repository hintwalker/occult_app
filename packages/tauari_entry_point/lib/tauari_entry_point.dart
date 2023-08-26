library tauari_entry_point;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EntryPoint extends StatelessWidget {
  final Widget child;
  final String translationPath;
  final List<Locale> supportedLocales;
  final Locale startLocale;
  final String restorationId;
  final Locale fallbackLocale;
  const EntryPoint({
    super.key,
    required this.child,
    required this.translationPath,
    required this.supportedLocales,
    required this.startLocale,
    this.restorationId = 'root',
    this.fallbackLocale = const Locale('vi'),
  });

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
      restorationId: restorationId,
      child: EasyLocalization(
        supportedLocales: supportedLocales,
        path: translationPath,
        fallbackLocale: fallbackLocale,
        startLocale: startLocale,
        child: child,
      ),
    );
  }
}
