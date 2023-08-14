import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
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
      onDeleteForever: (uid, item) => onDeleteForever(
        uid: uid,
        item: item,
        ref: ref,
        context: context,
      ),
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

  static Future<bool> onUpload<T>({
    required BuildContext context,
    required String? uid,
    required T item,
    required WidgetRef ref,
  }) async {
    if (uid == null) {
      await showDialog(
        context: context,
        builder: (_) => const NeedSignInAlertDialog(
          translate: translate,
        ),
      );
      return false;
    }
    bool resultOfExcutor = false;
    await ref.read(guardProvider).review().then((value) async {
      if (!value.connected) {
        await showDialog(
          context: context,
          builder: (_) => const NetworkNotConnectedAlertDialog(
            colorScheme: LasotuviAppStyle.colorScheme,
            translate: translate,
          ),
        );
        resultOfExcutor = false;
      } else if (!value.signedIn) {
        await showDialog(
          context: context,
          builder: (_) => const NeedSignInAlertDialog(
            translate: translate,
          ),
        );
        resultOfExcutor = false;
      } else {
        final allow = await _allow<T>(uid, ref);
        if (context.mounted) {
          if (!allow) {
            await showDialog(
                context: context,
                builder: (ctx) => const NeedUpgradePlanDialog(
                    // goToPlanMarket: () => showDialog(
                    //       context: ctx,
                    //       builder: (_) => BasicBottomSheet(
                    //         title: translate('energyPointMarket'),
                    //         colorScheme: LasotuviAppStyle.colorScheme,
                    //         child: const EnergyStoreContainer(),
                    //       ),
                    //     ),
                    translate: translate));
            resultOfExcutor = false;
          } else {
            await ref.read(uploaderProvider).upload(uid: uid, items: [item]);
            resultOfExcutor = true;
          }
        }
      }
    });
    return resultOfExcutor;
  }

  static Future<bool> _allow<T>(String uid, WidgetRef ref) async {
    final currentPlan = await ref.read(takeCurrentStoragePlanProvider)(uid);
    if (T == Chart) {
      final count = await ref.read(countChartOnCloudProvider)(uid);
      return count < currentPlan.limitChart;
    } else if (T == Tag) {
      final count = await ref.read(countTagOnCloudProvider)(uid);
      return count < currentPlan.limitTag;
    } else {
      final count = await ref.read(countNoteOnCloudProvider)(uid);
      return count < currentPlan.limitNote;
    }
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

  static Future<void> onDeleteForever<T>({
    required String uid,
    required T item,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    final result = await showDialog<ConfirmResult>(
      context: context,
      builder: (ctx) {
        String message = '';
        String confirmText = '';

        if (T == Chart) {
          message = 'warningDeleteChart';
          confirmText = 'confirmDeleteChart';
        } else if (T == Tag) {
          message = 'warningDeleteTag';
          confirmText = 'confirmDeleteTag';
        } else {
          message = 'warningDeleteNote';
          confirmText = 'confirmDeleteNote';
        }
        return DeleteDataConfirmDialog(
          translate: translate,
          message: translate(message),
          confirmText: translate(confirmText),
        );
      },
    );
    if (result != null) {
      if (result.yes) {
        await ref.read(removerProvider).deleteForever(uid: uid, items: [item]);
      }
    }
  }
}
