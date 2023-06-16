import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

import 'firebase_options.dart';
import 'router/router_provider.dart';

part 'screen/library.dart';
part 'screen/all_charts.dart';
part 'screen/all_notes.dart';
part 'screen/all_tags.dart';
part 'screen/all_commentaries.dart';
part 'screen/home.dart';
part 'screen/market.dart';
part 'screen/all_storage_plans.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initTempStorage();
  final localDatabase = await initLocalDatabase();

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
