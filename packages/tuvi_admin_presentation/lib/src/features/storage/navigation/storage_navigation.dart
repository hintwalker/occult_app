import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:storage_options/storage_options.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_style/tuvi_style.dart';

class StorageHelper {
  static Widget storageOptionsModalBuilder<T extends SyncableEntity>(
    T item, {
    required BuildContext context,
    required String? uid,
    required WidgetRef ref,
    required String? syncStatus,
    void Function()? doBeforeDeleteForever,
    void Function()? callback,
  }) {
    return StorageOptionsModal<T>(
      uid: uid,
      item: item,
      syncStatus: syncStatus,
      colorScheme: lightColorScheme,
      translate: translate,
      onUpload: (uid, item) => onUpload(
        context: context,
        uid: uid,
        item: item,
        ref: ref,
      ),
      onDownload: (uid, item) => onDownload(uid, item, ref),
      onDeleteFromCloud: (uid, item) => onDeleteFromCloud(uid, item, ref),
      onDeleteFromLocal: (item) => onDeleteFromLocal(item, ref),
      onDeleteForever: (uid, item) => onDeleteForever(uid, item, ref),
      doBeforeDeleteForever: doBeforeDeleteForever,
      callback: callback,
    );
  }

  static void showOptionsModal<T extends SyncableEntity>(
    T item, {
    required BuildContext context,
    required String? uid,
    required WidgetRef ref,
    void Function()? doBeforeDeleteForever,
    void Function()? callback,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => storageOptionsModalBuilder<T>(
        item,
        context: ctx,
        syncStatus: item.syncStatus,
        uid: uid,
        ref: ref,
        doBeforeDeleteForever: doBeforeDeleteForever,
        callback: callback,
      ),
    );
  }

  static Future<void> onUpload<T>({
    required BuildContext context,
    required String uid,
    required T item,
    required WidgetRef ref,
  }) async {
    await ref.read(guardProvider).review().then((value) async {
      if (!value.connected) {
        await showDialog(
          context: context,
          builder: (_) => const NetworkNotConnectedAlertDialog(
            colorScheme: LasotuviAppStyle.colorScheme,
            translate: translate,
          ),
        );
      } else if (!value.signedIn) {
        await showDialog(
          context: context,
          builder: (_) => const NeedSignInAlertDialog(
            colorScheme: LasotuviAppStyle.colorScheme,
            translate: translate,
          ),
        );
      } else {
        await ref.read(uploaderProvider).upload(uid: uid, items: [item]);
      }
    });
  }

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
