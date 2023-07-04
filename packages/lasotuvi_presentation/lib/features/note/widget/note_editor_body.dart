part of lasotuvi_presentation;

class NoteEditorBody extends ConsumerStatefulWidget {
  const NoteEditorBody(
    this.noteId, {
    super.key,
    required this.syncStatus,
  });
  final String noteId;
  final String syncStatus;

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
                          return WillPopScope(
                            onWillPop: () => onWillPop(note, context, ref),
                            child: NoteEditorWidget(
                              translate: translate,
                              colorScheme: lightColorScheme,
                              note: note,
                              onChanged: (note, uid) =>
                                  controller!.onChanged(note, ref, uid),
                              onSave: (note, uid) =>
                                  controller!.save(note: note, uid: uid),
                              toggleEditMode: (value) => ref
                                  .read(noteEditingStateProvider.notifier)
                                  .state = value,
                              onHitMaxLength: (value) =>
                                  onHitMaxLength(context, value),
                            ),
                          );
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
      controller: ref.read(noteEditorControllerProvider),
      child: (note) => WillPopScope(
        onWillPop: () => onWillPop(note, context, ref),
        child: NoteEditorWidget(
          translate: translate,
          colorScheme: lightColorScheme,
          note: note,
          onChanged: (note, uid) => controller!.onChanged(note, ref, uid),
          onSave: (note, uid) => controller!.save(note: note, uid: uid),
          toggleEditMode: (value) =>
              ref.read(noteEditingStateProvider.notifier).state = value,
          onHitMaxLength: (value) => onHitMaxLength(context, value),
        ),
      ),
    );
  }

  void onHitMaxLength(BuildContext context, int limit) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        translate('msgHitLimitNoteLength'),
        style: TextStyle(
          color: lightColorScheme.onErrorContainer,
        ),
      ),
      backgroundColor: lightColorScheme.errorContainer,
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
        if (context.mounted) {
          Navigator.of(context).pop(true);
        }
      } else if (result.yes) {
        final cache = await ref.read(noteEditorCacheProvider.future);
        final noteCached = await cache.get(note.id.toString());
        if (noteCached != null) {
          await controller!.save(note: noteCached, uid: uid);
        }
        await cache.clearAll();
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
