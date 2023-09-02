// import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
// import 'package:lstv_firestore_cache/src/entity/authenticated_box.dart';
// import 'package:lstv_firestore_cache/src/helper/uid_from_collection_path.dart';

// import 'collection_path_matcher.dart';

class FirestoreCacheHelper {
  static const energyBoxName = 'energy';
  static const chartBoxName = 'tuviChart';
  static const tagBoxName = 'tuviTag';
  static const noteBoxName = 'tuviNote';
  static const storagePlanBoxName = 'tuviStoragePlan';
  static const chartTagBoxName = 'chartTag';
  static const currentSubBoxName = 'currentSub';
  static const lastCanceledSubBoxName = 'lastCanceledSub';

  BoxCollection? cache;
  CollectionBox<Map>? energyBox;
  CollectionBox<Map>? chartBox;
  CollectionBox<Map>? tagBox;
  CollectionBox<Map>? noteBox;
  CollectionBox<Map>? storagePlanBox;
  CollectionBox<Map>? chartTagBox;
  CollectionBox<Map>? currentSubBox;
  CollectionBox<Map>? lastCanceledSubBox;

  ///
  /// Chỉ được gọi sau khi init Hive
  ///
  Future<void> ready(String? uid, {required String path}) async {
    cache = await setupCache(uid, path);
    energyBox = await cache?.openBox<Map>(energyBoxName);
    chartBox = await cache?.openBox<Map>(chartBoxName);
    tagBox = await cache?.openBox<Map>(tagBoxName);
    noteBox = await cache?.openBox<Map>(noteBoxName);
    storagePlanBox = await cache?.openBox<Map>(storagePlanBoxName);
    chartTagBox = await cache?.openBox<Map>(chartTagBoxName);
    currentSubBox = await cache?.openBox<Map>(currentSubBoxName);
    lastCanceledSubBox = await cache?.openBox<Map>(lastCanceledSubBoxName);
  }

  Future<BoxCollection> setupCache(
    String? uid,
    String path,
  ) async {
    return await BoxCollection.open(
      uid ?? 'anonymous',
      {
        energyBoxName,
        storagePlanBoxName,
        chartBoxName,
        tagBoxName,
        noteBoxName,
        chartTagBoxName,
        currentSubBoxName,
        lastCanceledSubBoxName,
      },
      path: path,
    );
  }

  CollectionBox? getBox(String name) {
    switch (name) {
      case energyBoxName:
        return energyBox;
      case storagePlanBoxName:
        return storagePlanBox;
      case chartBoxName:
        return chartBox;
      case tagBoxName:
        return tagBox;
      case noteBoxName:
        return noteBox;
      case chartTagBoxName:
        return chartTagBox;
      case currentSubBoxName:
        return currentSubBox;
      case lastCanceledSubBoxName:
        return lastCanceledSubBox;
      default:
        return null;
    }
  }

  // AuthenticatedBox? getBoxFromCollectionPath(String path) {
  //   final boxName = _parseCollectionPath(path);
  //   final uid = uidFromCollectionPath(path);
  //   switch (boxName) {
  //     case energyBoxName:
  //       return AuthenticatedBox(
  //         uid: uid,
  //         box: energyBox,
  //       );
  //     case chartBoxName:
  //       return AuthenticatedBox(
  //         uid: uid,
  //         box: chartBox,
  //       );
  //     case tagBoxName:
  //       return AuthenticatedBox(
  //         uid: uid,
  //         box: tagBox,
  //       );
  //     case noteBoxName:
  //       return AuthenticatedBox(
  //         uid: uid,
  //         box: noteBox,
  //       );
  //     case storagePlanBoxName:
  //       return AuthenticatedBox(
  //         uid: uid,
  //         box: storagePlanBox,
  //       );
  //     default:
  //       return null;
  //   }
  // }

  // String _parseCollectionPath(String path) {
  //   if (matchEnergyPattern(path)) {
  //     return energyBoxName;
  //   }
  //   if (matchChartPattern(path)) {
  //     return chartBoxName;
  //   }
  //   if (matchTagPattern(path)) {
  //     return tagBoxName;
  //   }
  //   if (matchNotePattern(path)) {
  //     return noteBoxName;
  //   }
  //   if (matchStoragePlanPattern(path)) {
  //     return storagePlanBoxName;
  //   }
  //   return '';
  // }

  Future<void> clear() async {
    await energyBox?.clear();
  }

  Future<void> close({bool clearAllData = false}) async {
    if (clearAllData) {
      await energyBox?.clear();

      // await chartBox.clear();
      // await tagBox.clear();
      // await noteBox.clear();
      // await storagePlanBox.clear();
    }

    cache?.close();
  }

  ///
  /// Chỉ sử dụng khi chưa init hive trước đó.
  ///
  static Future<void> initCache(String path) async {
    // if (alternateDirectory != null) {
    //   Hive.init(alternateDirectory);
    //   return;
    // }
    // final Directory directory =
    //     await path_provider.getApplicationDocumentsDirectory();
    Hive.init(path);
  }

  Future<void> pullFromFirestore(String uid) async {}
}
