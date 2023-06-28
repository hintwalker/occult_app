part of lasotuvi_presentation;

class TagCreationBody extends ConsumerWidget {
  const TagCreationBody({super.key});

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
    final tagId = await ref.read(insertTagToLocalProvider).call(Tag(
        now.millisecondsSinceEpoch,
        title: title,
        subTitle: subTitle,
        created: now));
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.pop();
      context.pushNamed(RouteName.tagDetail, pathParameters: {
        RouterParams.tagId: tagId.toString(),
      });
    });
  }
}
