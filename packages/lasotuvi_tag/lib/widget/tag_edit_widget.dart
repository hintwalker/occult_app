part of lasotuvi_tag;

class TagEditWidget extends StatelessWidget {
  const TagEditWidget(
    this.tag, {
    super.key,
    required this.colorScheme,
    required this.translate,
    required this.onSubmit,
  });
  final Tag tag;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final void Function(int tagId, String title, String subTitle) onSubmit;

  @override
  Widget build(BuildContext context) {
    return TagFormWidget(
      tagId: tag.id,
      title: tag.title,
      subTitle: tag.subTitle,
      colorScheme: colorScheme,
      translate: translate,
      submitButtonText: 'OK',
      onSubmit: (tagId, title, subTitle) {
        if (tagId != null) {
          onSubmit(
            tagId,
            title,
            subTitle,
          );
        }
      },
    );
  }
}
