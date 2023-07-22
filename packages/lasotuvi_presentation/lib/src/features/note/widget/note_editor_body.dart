import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_note/lasotuvi_note.dart' show NoteEditorBuilder;
import 'package:note_editor/note_editor.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

// import '../../../router/router_params.dart';
// import '../../auth/auth_depended_state.dart';
// import '../controller/note_editor_body_controller.dart';

class NoteEditorBody extends ConsumerStatefulWidget {
  const NoteEditorBody(
    this.noteId, {
    super.key,
    required this.syncStatus,
  });
  final String noteId;
  final String? syncStatus;

  @override
  ConsumerState<NoteEditorBody> createState() => _NoteEditorBodyState();
}

class _NoteEditorBodyState extends AuthDependedState<NoteEditorBody> {
  NoteEditorBodyController? controller;
  @override
  void initState() {
    super.initState();
    controller = NoteEditorBodyController(update: ref.read(updateNoteProvider));
  }

  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const LoadingWidget()
        : FutureBuilder(
            future: ref.read(noteEditorCacheProvider.future),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              } else if (snapshot.hasData) {
                return FutureBuilder(
                    future: snapshot.requireData.get(widget.noteId),
                    builder: (_, cache) {
                      if (cache.connectionState == ConnectionState.waiting) {
                        return const LoadingWidget();
                      } else if (cache.hasData) {
                        final note = cache.requireData;
                        if (note == null) {
                          return getEditor();
                        } else {
                          return getEditorWidget(note);
                        }
                      } else {
                        return getEditor();
                      }
                    });
              } else {
                return getEditor();
              }
            },
          );
  }

  Widget getEditor() {
    return NoteEditorBuilder(
      uid: uid,
      noteId: widget.noteId,
      syncStatus: RouterParams.getPathParamValue(widget.syncStatus),
      controller: ref.watch(noteEditorControllerProvider),
      child: (note) => getEditorWidget(note),
    );
  }

  Widget getEditorWidget(Note note) {
    return WillPopScope(
      onWillPop: () => onWillPop(note, context, ref),
      child: NoteEditorScaffold<Note>(
        note: note,
        colorScheme: LasotuviAppStyle.colorScheme,
        translate: translate,
        child: NoteEditorWidget<Note>(
          translate: translate,
          colorScheme: LasotuviAppStyle.colorScheme,
          note: note,
          onChanged: (note, uid) => controller!.onChanged(note, ref, uid),
          onSave: (note, uid) => controller!.save(note: note, uid: uid),
          toggleEditMode: (value) =>
              ref.read(noteEditingStateProvider.notifier).state = value,
          onHitMaxLength: (value) => onHitMaxLength(context, value),
        ),
        chartAvatar: (note) => chartAvatar(note),
      ),
    );
  }

  Widget chartAvatar(NoteLike note) {
    return FutureBuilder(
        future: ref.read(chartByNoteIdProvider).call(uid, note.noteId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final chart = snapshot.requireData;

            if (chart == null) {
              return const Text('');
            }
            final birthday = chart.birthday
                .toMoment(TimeZone(offsetInHour: chart.timeZoneOffset));
            final canWatchingYear = Can.ofLuniYear(chart.watchingYear);
            final chiWatchingYear = Chi.ofLuniYear(chart.watchingYear);
            return Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: Card(
                child: InkWell(
                  onTap: () => ChartNavigation.openChartView(
                    context: context,
                    chart: chart,
                  ),
                  // ChartHelper.openChartView(context: context, chart: chart),
                  borderRadius: BorderRadius.circular(12.0),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleHumanAvatar(
                          gender: chart.gender.intValue,
                          path: chart.avatar,
                        ),
                        const SizedBox(width: 8.0),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chart.name,
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
                                '${translate('watchingYear')}: ${chart.watchingYear} ${translate(canWatchingYear.name)} ${translate(chiWatchingYear.name)}'),
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

  void onHitMaxLength(BuildContext context, int limit) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        translate('msgHitLimitNoteLength'),
        style: TextStyle(
          color: LasotuviAppStyle.colorScheme.onErrorContainer,
        ),
      ),
      backgroundColor: LasotuviAppStyle.colorScheme.errorContainer,
      duration: const Duration(seconds: 1),
      showCloseIcon: true,
    ));
  }

  // Future<void> onSave(Note note, WidgetRef ref, String? uid) async {
  //   await ref.read(noteRepositoryProvider).update(note, uid);
  // }

  Future<bool> onWillPop(Note note, BuildContext context, WidgetRef ref) async {
    if (!ref.read(noteEditingStateProvider)) {
      Navigator.of(context).pop(true);
      return Future.value(true);
    }
    final result = await showDialog<ConfirmResult>(
        context: context,
        builder: (context) {
          return const NoteSaveConfirmDialog(translate: translate);
          // AlertDialog(
          //   title: const Text(widget.translate('save?')),
          //   actions: [
          //     TextButton(
          //       style: TextButton.styleFrom(
          //         textStyle: Theme.of(context).textTheme.labelLarge,
          //       ),
          //       child: const Text('No'),
          //       onPressed: () {
          //         Navigator.of(context).pop(false);
          //       },
          //     ),
          //     TextButton(
          //       style: TextButton.styleFrom(
          //         textStyle: Theme.of(context).textTheme.labelLarge,
          //       ),
          //       child: const Text('OK'),
          //       onPressed: () async {
          //         final cache = await ref.read(noteEditorCacheProvider.future);
          //         final noteCached = await cache.get(note.id.toString());
          //         if (noteCached != null) {
          //           await ref
          //               .read(noteRepositoryProvider)
          //               .update(noteCached, uid);
          //         }
          //         ref.read(noteEditingStateProvider.notifier).state = false;
          //         if (context.mounted) {
          //           Navigator.of(context).pop(true);
          //         }
          //       },
          //     ),
          //   ],
          // );
        });
    if (result != null) {
      if (result.no) {
        ref.read(noteEditingStateProvider.notifier).update((state) => false);
        final cache = await ref.read(noteEditorCacheProvider.future);
        await cache.clear(note.docId);
        if (context.mounted) {
          Navigator.of(context).pop(true);
        }
      } else if (result.yes) {
        final cache = await ref.read(noteEditorCacheProvider.future);
        final noteCached = await cache.get(note.docId);
        if (noteCached != null) {
          await controller!.save(note: noteCached, uid: uid);
        }
        await cache.clear(note.docId);
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          if (context.mounted) {
            Navigator.of(context).pop(true);
          }
        });
      }
    }

    return false;
    // return result ?? true;
    // final cache = await ref.read(noteEditorCacheProvider.future);
    // final noteCached = await cache.get(note.id.toString());
    // if (noteCached != null) {
    //   await ref.read(noteRepositoryProvider).update(noteCached, uid);
    // }
    // return Future.value(true);

    // cache.whenData((value) async {
    //   final noteCached = await value.get(note.id.toString());
    //   if (noteCached != null) {
    //     await value.save(noteCached);
    //   }
    //   return Future.value(true);
    // });
    // final noteCached =
    //     await ref.read(noteEditorCacheProvider).get(note.id.toString());
    // if (noteCached != null) {
    //   await ref.read(noteEditorCacheProvider).save(noteCached);
    // }
    // return Future.value(false);
  }
}
