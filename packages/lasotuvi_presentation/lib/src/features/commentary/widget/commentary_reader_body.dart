import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_commentary/lasotuvi_commentary.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../request/navigation/request_navigation.dart';
import '../controller/commentary_reader_body_controller.dart';

// import '../../../router/router_params.dart';
// import '../../auth/auth_depended_state.dart';
// import '../controller/commentary_editor_body_controller.dart';

class CommentaryReaderBody extends ConsumerStatefulWidget {
  const CommentaryReaderBody(
    this.commentaryId, {
    super.key,
    required this.syncStatus,
  });
  final int commentaryId;
  final String? syncStatus;

  @override
  ConsumerState<CommentaryReaderBody> createState() =>
      _CommentaryReaderBodyState();
}

class _CommentaryReaderBodyState
    extends UserAuthDependedState<CommentaryReaderBody> {
  CommentaryReaderBodyController? controller;
  @override
  void initState() {
    super.initState();
    controller = CommentaryReaderBodyController(
        update: ref.read(updateCommentaryProvider));
  }

  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const LoadingWidget()
        : BasicStreamBuilder(
            stream: ref.watch(commentaryReaderControllerProvider).stream(
                  uid: uid,
                  docId: widget.commentaryId,
                  syncStatus: widget.syncStatus,
                ),
            child: (commentary) => commentary == null
                ? const ErrorTextWidget()
                : CommentaryReaderModal(
                    commentary: commentary,
                    colorScheme: LasotuviAppStyle.colorScheme,
                    translate: translate,
                    child: CommentaryReaderWidget(
                      translate: translate,
                      colorScheme: LasotuviAppStyle.colorScheme,
                      commentary: commentary,
                      // onChanged: (commentary, uid) => controller!.onChanged(commentary, ref, uid),
                      // onSave: (commentary, uid) => controller!.save(commentary: commentary, uid: uid),
                      // toggleEditMode: (value) =>
                      //     ref.read(commentaryEditingStateProvider.notifier).state = value,
                      // onHitMaxLength: (value) =>
                      //     onHitMaxLength(context, value),
                    ),
                    chartAvatar: (commentary) => chartAvatar(commentary),
                  ),
          );
  }

  // Widget getReader() {
  //   return CommentaryReaderBuilder(
  //     uid: uid,
  //     commentaryId: widget.commentaryId,
  //     syncStatus: RouterParams.getPathParamValue(widget.syncStatus),
  //     controller: ref.watch(commentaryReaderControllerProvider),
  //     child: (commentary) => getReaderWidget(commentary),
  //   );
  // }

  // Widget getReaderWidget(Commentary commentary) {
  //   return WillPopScope(
  //     onWillPop: () => onWillPop(commentary, context, ref),
  //     child: CommentaryReaderModal(
  //       commentary: commentary,
  //       colorScheme: LasotuviAppStyle.colorScheme,
  //       translate: translate,
  //       child: CommentaryReaderWidget(
  //         translate: translate,
  //         colorScheme: LasotuviAppStyle.colorScheme,
  //         commentary: commentary,
  //         onChanged: (commentary, uid) =>
  //             controller!.onChanged(commentary, ref, uid),
  //         onSave: (commentary, uid) =>
  //             controller!.save(commentary: commentary, uid: uid),
  //         toggleEditMode: (value) =>
  //             ref.read(commentaryEditingStateProvider.notifier).state = value,
  //         onHitMaxLength: (value) => onHitMaxLength(context, value),
  //       ),
  //       chartAvatar: (commentary) => chartAvatar(commentary),
  //     ),
  //   );
  // }

  Widget chartAvatar(Commentary commentary) {
    return FutureBuilder(
        future: ref.read(requestByCommentaryIdProvider).call(
              uid: uid,
              dependentId: commentary.id,
            ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final request = snapshot.requireData;

            if (request == null) {
              return const Text('');
            }
            final birthday = request.birthday
                .toMoment(TimeZone(offsetInHour: request.timeZoneOffset));
            final canWatchingYear = Can.ofLuniYear(request.watchingYear);
            final chiWatchingYear = Chi.ofLuniYear(request.watchingYear);
            return Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: Card(
                child: InkWell(
                  onTap: () => RequestNavigation.openRequestView(
                    context: context,
                    request: request,
                  ),
                  // RequestHelper.openRequestView(context: context, chart: chart),
                  borderRadius: BorderRadius.circular(12.0),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleHumanAvatar(
                          gender: request.gender.intValue,
                          path: request.avatar,
                        ),
                        const SizedBox(width: 8.0),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              request.name,
                            ),
                            Row(
                              children: [
                                Text(birthday.toGregorianDateTimeString()),
                                Text(
                                  ' (${birthday.toLuniSolarDateString(
                                    canName: (can) => translate(can.name),
                                    chiName: (chi) => translate(chi.name),
                                  )})',
                                ),
                              ],
                            ),
                            Text(
                                '${translate('watchingYear')}: ${request.watchingYear} ${translate(canWatchingYear.name)} ${translate(chiWatchingYear.name)}'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
            // return CircleHumanAvatar(
            //   gender: chart.gender.intValue,
            //   path: chart.avatar,
            // );
          } else {
            return const Text('');
          }
        });
  }

  // void onHitMaxLength(BuildContext context, int limit) {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(
  //       translate('msgHitLimitCommentaryLength'),
  //       style: TextStyle(
  //         color: LasotuviAppStyle.colorScheme.onErrorContainer,
  //       ),
  //     ),
  //     backgroundColor: LasotuviAppStyle.colorScheme.errorContainer,
  //     duration: const Duration(seconds: 1),
  //     showCloseIcon: true,
  //   ));
  // }

  // Future<void> onSave(Commentary commentary, WidgetRef ref, String? uid) async {
  //   await ref.read(commentaryRepositoryProvider).update(commentary, uid);
  // }

  // Future<bool> onWillPop(
  //     Commentary commentary, BuildContext context, WidgetRef ref) async {
  //   if (!ref.read(commentaryEditingStateProvider)) {
  //     Navigator.of(context).pop(true);
  //     return Future.value(true);
  //   }
  //   final result = await showDialog<ConfirmResult>(
  //       context: context,
  //       builder: (context) {
  //         return const CommentarySaveConfirmDialog(translate: translate);
  //         // AlertDialog(
  //         //   title: const Text(widget.translate('save?')),
  //         //   actions: [
  //         //     TextButton(
  //         //       style: TextButton.styleFrom(
  //         //         textStyle: Theme.of(context).textTheme.labelLarge,
  //         //       ),
  //         //       child: const Text('No'),
  //         //       onPressed: () {
  //         //         Navigator.of(context).pop(false);
  //         //       },
  //         //     ),
  //         //     TextButton(
  //         //       style: TextButton.styleFrom(
  //         //         textStyle: Theme.of(context).textTheme.labelLarge,
  //         //       ),
  //         //       child: const Text('OK'),
  //         //       onPressed: () async {
  //         //         final cache = await ref.read(commentaryReaderCacheProvider.future);
  //         //         final commentaryCached = await cache.get(commentary.id.toString());
  //         //         if (commentaryCached != null) {
  //         //           await ref
  //         //               .read(commentaryRepositoryProvider)
  //         //               .update(commentaryCached, uid);
  //         //         }
  //         //         ref.read(commentaryEditingStateProvider.notifier).state = false;
  //         //         if (context.mounted) {
  //         //           Navigator.of(context).pop(true);
  //         //         }
  //         //       },
  //         //     ),
  //         //   ],
  //         // );
  //       });
  //   if (result != null) {
  //     if (result.no) {
  //       ref
  //           .read(commentaryEditingStateProvider.notifier)
  //           .update((state) => false);
  //       final cache = await ref.read(commentaryReaderCacheProvider.future);
  //       await cache.clear(commentary.docId);
  //       if (context.mounted) {
  //         Navigator.of(context).pop(true);
  //       }
  //     } else if (result.yes) {
  //       final cache = await ref.read(commentaryReaderCacheProvider.future);
  //       final commentaryCached = await cache.get(commentary.docId);
  //       if (commentaryCached != null) {
  //         await controller!.save(commentary: commentaryCached, uid: uid);
  //       }
  //       await cache.clear(commentary.docId);
  //       SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
  //         if (context.mounted) {
  //           Navigator.of(context).pop(true);
  //         }
  //       });
  //     }
  //   }

  //   return false;
  //   // return result ?? true;
  //   // final cache = await ref.read(commentaryReaderCacheProvider.future);
  //   // final commentaryCached = await cache.get(commentary.id.toString());
  //   // if (commentaryCached != null) {
  //   //   await ref.read(commentaryRepositoryProvider).update(commentaryCached, uid);
  //   // }
  //   // return Future.value(true);

  //   // cache.whenData((value) async {
  //   //   final commentaryCached = await value.get(commentary.id.toString());
  //   //   if (commentaryCached != null) {
  //   //     await value.save(commentaryCached);
  //   //   }
  //   //   return Future.value(true);
  //   // });
  //   // final commentaryCached =
  //   //     await ref.read(commentaryReaderCacheProvider).get(commentary.id.toString());
  //   // if (commentaryCached != null) {
  //   //   await ref.read(commentaryReaderCacheProvider).save(commentaryCached);
  //   // }
  //   // return Future.value(false);
  // }
}
