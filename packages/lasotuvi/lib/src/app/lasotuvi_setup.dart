import 'dart:io';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_sqflite/tauari_sqflite.dart';
import 'package:sqflite/sqflite.dart' as sqflite show databaseFactory;

import '../../firebase_options.dart';

class LasotuviSetup {
  static Future<LocalDatabase<Database>> ready() async {
    initGoRouter();
    await initFirebase();
    await initTempStorage();
    if (AppConfig.showAds) {
      await initAds();
    }
    return await initLocalDatabase();
  }

  static Future<void> initFirebase() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: 'recaptcha-v3-site-key',
      // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
      // your preferred provider. Choose from:
      // 1. Debug provider
      // 2. Safety Net provider
      // 3. Play Integrity provider
      androidProvider:
          kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity,
      // androidProvider: AndroidProvider.debug,
      // Default provider for iOS/macOS is the Device Check provider. You can use the "AppleProvider" enum to choose
      // your preferred provider. Choose from:
      // 1. Debug provider
      // 2. Device Check provider
      // 3. App Attest provider
      // 4. App Attest provider with fallback to Device Check provider (App Attest provider is only available on iOS 14.0+, macOS 14.0+)
      // appleProvider: AppleProvider.appAttest,
    );
  }

  static Future<void> initAds() async {
    RequestConfiguration configuration = RequestConfiguration(
        testDeviceIds: ["B25285BA668EE2347809BEE76CDC2415"]);
    await MobileAds.instance.updateRequestConfiguration(configuration);
    await MobileAds.instance.initialize();
  }

  static Future<void> initTempStorage() async {
    final Directory directory = await getApplicationCacheDirectory();
    // Hive.init(directory.path);
    await Hive.initFlutter(directory.path);
    await LasotuviSettings.openSettingsBoxes();
  }

  static Future<LocalDatabase<Database>> initLocalDatabase() async {
    final dbFactory = sqflite.databaseFactory;
    final localDatabase = SqliteDatabase(
      dbFactory,
      onCreated: onDbCreated,
      onConfigure: onDbConfigure,
      // onUpgrade: (db, oldVersion, newVersion) => onDbUpgrade(
      //   db: db,
      //   oldVersion: oldVersion,
      //   newVersion: newVersion,
      // ),
      databaseName: DatabaseNames.v1_2,
      version: 1,
    );
    await localDatabase.ready;

    return localDatabase;
  }

  static void initGoRouter() {
    GoRouter.optionURLReflectsImperativeAPIs = true;
  }
}
