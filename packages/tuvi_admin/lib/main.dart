import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tauari_entry_point/tauari_entry_point.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tuvi_admin/src/app/tuvi_admin_app.dart';
import 'package:tuvi_admin/src/app/tuvi_admin_setup.dart';
import 'package:tuvi_admin/src/translation_path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localDatabase = await TuviAdminSetup.ready();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) => runApp(EntryPoint(
        translationPath: translationPath,
        supportedLocales: supportedLocales,
        startLocale: const Locale('vi'),
        child: TuviAdminApp(localDatabase: localDatabase))),
  );
}
