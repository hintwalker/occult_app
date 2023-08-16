import 'package:tauari_values/tauari_values.dart';

bool onlyOnLocal({required String? uid, required String? syncStatus}) {
  return uid == null ||
      syncStatus == null ||
      !(syncStatus == SyncStatus.onlyCloud || syncStatus == SyncStatus.synced);
}
