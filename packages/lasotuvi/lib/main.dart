import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lasotuvi/src/app/lasotuvi_app.dart';
import 'package:lasotuvi/src/app/lasotuvi_setup.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
import 'package:tauari_entry_point/tauari_entry_point.dart';
import 'package:tauari_translate/tauari_translate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localDatabase = await LasotuviSetup.ready();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then(
    (_) => runApp(
      EntryPoint(
        translationPath: translationPath,
        supportedLocales: supportedLocales,
        startLocale: const Locale('vi'),
        child: LasotuviApp(localDatabase: localDatabase),
      ),
    ),
  );
}
