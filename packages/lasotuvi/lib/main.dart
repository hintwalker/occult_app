import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_drawer/tauari_drawer.dart';
import 'package:tauari_sqflite/tauari_sqflite.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqflite/sqflite.dart' as sqflite show databaseFactory;
import 'package:tuvi_style/tuvi_style.dart';

import 'src/firebase_options.dart';
import 'src/router/router_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAppCheck.instance.activate(
  //   webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  //   // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
  //   // your preferred provider. Choose from:
  //   // 1. Debug provider
  //   // 2. Safety Net provider
  //   // 3. Play Integrity provider
  //   androidProvider: AndroidProvider.debug,
  //   // Default provider for iOS/macOS is the Device Check provider. You can use the "AppleProvider" enum to choose
  //   // your preferred provider. Choose from:
  //   // 1. Debug provider
  //   // 2. Device Check provider
  //   // 3. App Attest provider
  //   // 4. App Attest provider with fallback to Device Check provider (App Attest provider is only available on iOS 14.0+, macOS 14.0+)
  //   // appleProvider: AppleProvider.appAttest,
  // );

  await initTempStorage();
  final localDatabase = await initLocalDatabase();

  GoRouter.optionURLReflectsImperativeAPIs = true;

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(EntryPoint(
        translationPath: translationPath,
        supportedLocales: supportedLocales,
        startLocale: const Locale('vi'),
        child: ProviderScope(
            overrides: [
              localDatabaseProvider.overrideWithValue(localDatabase),
              routerProvider
                  .overrideWith((ref) => ref.read(lasotuviRouterProvider)),
              mainDrawerControllerProvider
                  .overrideWithValue(TauariDrawerController()),
              restorableStateProvider
                  .overrideWith((ref) => RestorableStateImpl())
            ],
            child: RestorableApp(
              // routerProvider: routerProvider,
              title: translate('lasotuvi'),
              theme: AppTheme.light(),
            )),
      )));
}

Future<void> initTempStorage() async {
  final Directory directory =
      await path_provider.getApplicationDocumentsDirectory();
  // Hive.init(directory.path);
  await Hive.initFlutter(directory.path);
}

Future<LocalDatabase<Database>> initLocalDatabase() async {
  final dbFactory = sqflite.databaseFactory;
  final localDatabase = SqliteDatabase(dbFactory,
      onCreated: onDbCreated,
      onConfigure: onDbConfigure,
      databaseName: DatabaseNames.v1_2);
  await localDatabase.ready;
  return localDatabase;
}
