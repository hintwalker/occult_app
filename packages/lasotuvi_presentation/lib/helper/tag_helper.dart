part of lasotuvi_presentation;

class TagHelper {
  static void openTagCreation({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const TagCreationBody(),
    );
  }

  static void openTagDetail({
    required BuildContext context,
    required Tag tag,
  }) {
    context.pushNamed(RouteName.tagDetail, pathParameters: {
      RouterParams.tagId: tag.docId,
    });
  }

  static openTagEdit(BuildContext context, Tag tag) {
    showModalBottomSheet(
      context: context,
      builder: (context) => TagEditBody(tag),
    );
  }

  static void openCheckboxTagList(BuildContext context, Chart chart) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) =>
          Material(child: CheckboxTagListBody(chart)),
    );
  }
}
