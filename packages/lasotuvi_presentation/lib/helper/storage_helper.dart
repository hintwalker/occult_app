part of lasotuvi_presentation;

class StorageHelper {
  static Widget storageOptionsModalBuilder<T extends SyncableEntity>(
    T item, {
    String? uid,
    required WidgetRef ref,
    String? syncStatus,
    void Function()? doBeforeDeleteForever,
  }) {
    return StorageOptionsModal<T>(
      uid: uid,
      item: item,
      syncStatus: syncStatus,
      colorScheme: lightColorScheme,
      translate: translate,
      onUpload: (uid, item) => onUpload(uid, item, ref),
      onDownload: (uid, item) => onDownload(uid, item, ref),
      onDeleteFromCloud: (uid, item) => onDeleteFromCloud(uid, item, ref),
      onDeleteFromLocal: (item) => onDeleteFromLocal(item, ref),
      onDeleteForever: (uid, item) => onDeleteForever(uid, item, ref),
      doBeforeDeleteForever: () {
        if (doBeforeDeleteForever != null) {
          doBeforeDeleteForever();
        }
      },
    );
  }

  static void showOptionsModal<T extends SyncableEntity>(
    T item, {
    required BuildContext context,
    String? uid,
    required WidgetRef ref,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (_) => storageOptionsModalBuilder<T>(
        item,
        syncStatus: item.syncStatus,
        uid: uid,
        ref: ref,
      ),
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
