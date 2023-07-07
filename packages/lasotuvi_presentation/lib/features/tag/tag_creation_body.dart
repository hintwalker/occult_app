part of lasotuvi_presentation;

class TagCreationBody extends ConsumerWidget {
  const TagCreationBody({super.key, required this.doAfterCreation});
  final void Function(Tag tag)? doAfterCreation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TagCreationModal(
        colorScheme: lightColorScheme,
        translate: translate,
        onCreateTag: (title, subTitle) => onCreateTag(
            context: context, title: title, subTitle: subTitle, ref: ref));
  }

  Future<void> onCreateTag({
    required BuildContext context,
    required String title,
    required String subTitle,
    required WidgetRef ref,
  }) async {
    final now = DateTime.now();
    final tag = Tag(now.millisecondsSinceEpoch,
        title: title, subTitle: subTitle, created: now);
    await ref.read(insertTagToLocalProvider).call(tag);
    if (doAfterCreation != null) {
      doAfterCreation!(tag);
    }

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.pop();
      }

      // TagHelper.openTagDetail(context: context, tag: tag);
      // context.pushNamed(RouteName.tagDetail, pathParameters: {
      //   RouterParams.tagId: tagId.toString(),
      // });
    });
  }
}
