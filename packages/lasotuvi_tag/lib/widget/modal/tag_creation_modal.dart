part of lasotuvi_tag;

class TagCreationModal extends StatelessWidget {
  const TagCreationModal({
    super.key,
    required this.colorScheme,
    required this.translate,
    required this.onCreateTag,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final void Function(String title, String subTitle) onCreateTag;

  @override
  Widget build(BuildContext context) {
    return BasicBottomSheet(
        title: translate('tagCreation'),
        colorScheme: colorScheme,
        child: TagCreationWidget(
            colorScheme: colorScheme,
            translate: translate,
            onCreateTag: onCreateTag));
  }
}
