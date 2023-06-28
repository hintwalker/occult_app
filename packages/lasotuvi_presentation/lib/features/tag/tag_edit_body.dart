part of lasotuvi_presentation;

class TagEditBody extends ConsumerStatefulWidget {
  const TagEditBody(this.tag, {super.key});
  final Tag tag;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TagEditBodyState();
}

class _TagEditBodyState extends AuthDependedState<TagEditBody> {
  @override
  Widget build(BuildContext context) {
    return TagEditModal(widget.tag,
        colorScheme: lightColorScheme,
        translate: translate,
        onSubmit: (tagId, title, subTitle) => onEditTag(
            uid: uid,
            context: context,
            tag: widget.tag.copyWith(title: title, subTitle: subTitle),
            ref: ref));
  }

  Future<void> onEditTag({
    String? uid,
    required BuildContext context,
    required Tag tag,
    required WidgetRef ref,
  }) async {
    await ref.read(updateTagProvider).call(uid, tag);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.pop();
    });
  }
}
