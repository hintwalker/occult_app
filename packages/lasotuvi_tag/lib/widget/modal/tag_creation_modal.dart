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
    return BasicDialog(
      title: translate('tagCreation hoij pijo oih pijs'),
      // colorScheme: colorScheme,
      children: [
        TagCreationWidget(
            colorScheme: colorScheme,
            translate: translate,
            onCreateTag: onCreateTag),
      ],
    );
  }
}
