part of tauari_data_core;

bool onlyOnLocal({required String? uid, required String? syncStatus}) {
  return uid == null ||
      syncStatus == null ||
      syncStatus == SyncStatus.onlyLocal;
}
