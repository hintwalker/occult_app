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
    return SimpleDialog(
      title: Row(
        children: [
          Expanded(
            child: Text(
              translate('tagCreation hoij pijo oih pijs'),
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      titlePadding:
          const EdgeInsets.only(left: 12.0, top: 8.0, right: 8.0, bottom: 0.0),
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
