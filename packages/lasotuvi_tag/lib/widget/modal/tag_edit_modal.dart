part of lasotuvi_tag;

class TagEditModal extends StatelessWidget {
  const TagEditModal(
    this.tag, {
    super.key,
    required this.colorScheme,
    required this.translate,
    required this.onSubmit,
  });
  final Tag tag;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final void Function(int? tagId, String title, String subTitle) onSubmit;

  @override
  Widget build(BuildContext context) {
    return BasicBottomSheet(
        title: translate('editTagInfo'),
        colorScheme: colorScheme,
        child: TagEditWidget(tag,
            colorScheme: colorScheme,
            translate: translate,
            onSubmit: onSubmit));
  }
}
