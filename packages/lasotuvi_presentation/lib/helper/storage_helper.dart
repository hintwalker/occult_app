part of lasotuvi_presentation;

class StorageHelper {
  static Widget storageOptionsModalBuilder<T extends SyncableEntity<T>>(T item,
      {String? uid, required WidgetRef ref, String? onCloud}) {
    return StorageOptionsModal<T>(
      uid: uid,
      item: item,
      onCloud: onCloud,
      colorScheme: lightColorScheme,
      translate: translate,
      onUpload: (uid, item) => onUpload(uid, item, ref),
      onDownload: (uid, item) => onDownload(uid, item, ref),
      onDeleteFromCloud: (uid, item) => onDeleteFromCloud(uid, item, ref),
      onDeleteFromLocal: (item) => onDeleteFromLocal(item, ref),
      onDeleteForever: (uid, item) => onDeleteForever(uid, item, ref),
    );
  }

  static Future<void> onUpload<T>(String uid, T item, WidgetRef ref) =>
      ref.read(uploaderProvider).upload(uid: uid, items: [item]);

  static Future<void> onDownload<T>(String uid, T item, WidgetRef ref) =>
      ref.read(downloaderProvider).download(uid: uid, items: [item]);

  static Future<void> onDeleteFromCloud<T>(String uid, T item, WidgetRef ref) =>
      ref.read(removerProvider).deleteFromCloud(uid: uid, items: [item]);

  static Future<void> onDeleteFromLocal<T>(
    T item,
    WidgetRef ref,
  ) =>
      ref.read(removerProvider).deleteFromLocal(items: [item]);

  static Future<void> onDeleteForever<T>(String uid, T item, WidgetRef ref) =>
      ref.read(removerProvider).deleteForever(uid: uid, items: [item]);
}
