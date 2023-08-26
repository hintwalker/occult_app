import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:storage_options/storage_options.dart';
import 'package:tauari_auth_widget/tauari_auth_widget.dart';
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
    void Function()? doAfterDeleteForerver,
    void Function(String? syncStatus)? callback,
  }) {
    return StorageOptionsModal<T>(
      uid: uid,
      item: item,
      syncStatus: syncStatus,
      colorScheme: lightColorScheme,
      translate: translate,
      onUpload: (uid, item) => onUpload(
        context: context,
        uid: ref.read(takeCurrentUserProvider)()?.uidInFirestore,
        item: item,
        ref: ref,
      ),
      onDownload: (uid, item) => onDownload(
          ref.read(takeCurrentUserProvider)()?.uidInFirestore, item, ref),
      onDeleteFromCloud: (uid, item) => onDeleteFromCloud(
          context: context,
          uid: ref.read(takeCurrentUserProvider)()?.uidInFirestore,
          item: item,
          ref: ref),
      onDeleteFromLocal: (item) => onDeleteFromLocal(context, item, ref),
      onDeleteForever: (uid, item) => onDeleteForever(
        uid: ref.read(takeCurrentUserProvider)()?.uidInFirestore,
        item: item,
        ref: ref,
        context: context,
      ),
      doBeforeDeleteForever: doBeforeDeleteForever,
      doAfterDeleteForever: doAfterDeleteForerver,
      callback: callback,
    );
  }

  static void showOptionsModal<T extends SyncableEntity>(
    T item, {
    required BuildContext context,
    required String? uid,
    required WidgetRef ref,
    void Function()? doBeforeDeleteForever,
    void Function()? doAfterDeleteForever,
    void Function(String? syncStatus)? callback,
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
        doAfterDeleteForerver: doAfterDeleteForever,
        callback: callback,
      ),
    );
  }

  static Future<bool> onUpload<T extends Syncable>({
    required BuildContext context,
    required String? uid,
    required T item,
    required WidgetRef ref,
  }) async {
    if (uid == null) {
      await showDialog(
        context: context,
        builder: (ctx) => NeedSignInAlertDialog(
          translate: translate,
          onCancel: () {
            // Navigator.pop(ctx);
            Navigator.pop(context);
          },
          signInButton: GoogleSignInButton(
            onTap: () async {
              if (context.mounted) {
                final user = await ref.read(signInWithGoogleProvider)();
                if (user != null) {
                  if (context.mounted) {
                    Navigator.pop(ctx);
                    Navigator.pop(context);
                    // onUpload(
                    //   context: context,
                    //   uid: user.uidInFirestore,
                    //   item: item,
                    //   ref: ref,
                    // );
                  }
                }

                // onUpload(
                //   context: context,
                //   uid: uid,
                //   item: item,
                //   ref: ref,
                // );
                // Navigator.popUntil(
                //     ctx, (route) => route.settings.name == RouteName.chartView);
                // Navigator.maybePop(ctx);
                // Navigator.maybePop(context);
                // if (user != null) {
                //   Navigator.maybePop(context);
                // }
              }
            },
            title: translate('signIn'),
          ),
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
          builder: (ctx) => NeedSignInAlertDialog(
            translate: translate,
            onCancel: () {
              // Navigator.pop(ctx);
              Navigator.pop(context);
            },
            signInButton: GoogleSignInButton(
              onTap: () async {
                await ref.read(signInWithGoogleProvider).call();
                if (context.mounted) {
                  Navigator.maybePop(ctx);
                  Navigator.maybePop(context);
                }
              },
              title: translate('signIn'),
            ),
          ),
        );
        resultOfExcutor = false;
      } else {
        bool ableToUpload = await ref
            .read(ableToUploadProvider)
            .call<T>(1); //await _allow<T>(uid, ref);
        bool ableToUploadOwner = true;
        Chart? chart;
        if (T == Note) {
          chart = await ref.read(chartByNoteIdProvider).call(
                uid: uid,
                dependentId: item.syncId,
              );
          if (onlyOnLocal(uid: uid, syncStatus: chart?.syncStatus)) {
            ableToUploadOwner =
                await ref.read(ableToUploadProvider).call<Chart>(1);
          }

          ableToUpload = ableToUpload && ableToUploadOwner;
        }
        if (context.mounted) {
          if (!ableToUpload) {
            await showDialog(
              context: context,
              builder: (ctx) => OutOfSpaceDialog(
                  // goToPlanMarket: () => showDialog(
                  //       context: ctx,
                  //       builder: (_) => BasicBottomSheet(
                  //         title: translate('energyPointMarket'),
                  //         colorScheme: LasotuviAppStyle.colorScheme,
                  //         child: const EnergyStoreContainer(),
                  //       ),
                  //     ),
                  colorScheme: LasotuviAppStyle.colorScheme,
                  translate: translate,
                  message: ableToUploadOwner
                      ? null
                      : translate('needUploadChartFollow'),
                  goToPlanList: () {
                    Navigator.pop(ctx);
                    Navigator.pop(context);
                    ref
                        .read(mainDrawerControllerProvider)
                        .setScreenId(DrawerIds.storagePlanMarket);
                    // Navigator.popUntil(
                    //     context,
                    //     (route) =>
                    //         route.settings.name == RouteName.storagePlanMarket);
                  }),
            );
            resultOfExcutor = false;
          } else {
            // final ableToUpload = await ref.read(ableToUploadProvider)(1);
            // if (ableToUpload) {
            if (T == Note) {
              // final chart = await ref.read(chartByNoteIdProvider).call(
              //       uid: uid,
              //       dependentId: item.syncId,
              //     );
              if (chart != null) {
                await ref.read(uploaderProvider).upload(
                  uid: uid,
                  items: [chart],
                );
                await ref.read(uploaderProvider).upload(
                  uid: uid,
                  items: [item],
                );
              }
            } else {
              await ref.read(uploaderProvider).upload(
                uid: uid,
                items: [item],
              );
            }

            resultOfExcutor = true;
            // } else {
            //   if (context.mounted) {
            //     await showDialog(
            //       context: context,
            //       builder: (ctx) =>
            //           const OutOfSpaceDialog(translate: translate),
            //     );
            //   }

            //   resultOfExcutor = true;
            // }
          }
        }
      }
    });
    return resultOfExcutor;
  }

  // static Future<bool> _allow<T>(String uid, WidgetRef ref) async {
  //   final currentPlan = await ref.read(takeCurrentStoragePlanProvider)(uid);
  //   if (T == Chart) {
  //     final count = await ref.read(countChartOnCloudProvider)(uid);
  //     return count < currentPlan.limitChart;
  //   } else if (T == Tag) {
  //     final count = await ref.read(countTagOnCloudProvider)(uid);
  //     return count < currentPlan.limitTag;
  //   } else {
  //     final count = await ref.read(countNoteOnCloudProvider)(uid);
  //     return count < currentPlan.limitNote;
  //   }
  // }

  static Future<void> onDownload<T>(String? uid, T item, WidgetRef ref) async {
    if (uid != null) {
      ref.read(downloaderProvider).download(uid: uid, items: [item]);
    }
  }

  static Future<void> onDeleteFromCloud<T>({
    required BuildContext context,
    required String? uid,
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
      } else {
        if (uid != null) {
          await ref
              .read(removerProvider)
              .deleteFromCloud(uid: uid, items: [item]);
        }
      }
    });
  }

  static Future<void> onDeleteFromLocal<T>(
    BuildContext context,
    T item,
    WidgetRef ref,
  ) async {
    final result = await showDialog<ConfirmResult>(
      context: context,
      builder: (ctx) {
        String message = '';
        String confirmText = '';

        if (T == Chart) {
          message = 'warningDeleteChartOnLocal';
          confirmText = 'confirmDeleteChartOnLocal';
        } else if (T == Tag) {
          message = 'warningDeleteTagOnLocal';
          confirmText = 'confirmDeleteTagOnLocal';
        } else {
          message = 'warningDeleteNoteOnLocal';
          confirmText = 'confirmDeleteNoteOnLocal';
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
        await ref.read(removerProvider).deleteFromLocal(items: [item]);
      }
    }
  }

  static Future<void> onDeleteForever<T extends Syncable>({
    required String? uid,
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
