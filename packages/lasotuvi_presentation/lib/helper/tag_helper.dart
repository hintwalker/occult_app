part of lasotuvi_presentation;

class TagHelper {
  static void openTagCreationScreen(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) => const TagCreationBody(),
    );
    // showModalBottomSheet(
    //   context: context,
    //   builder: (context) => const TagCreationBody(),
    // );
  }

  static void openTagDetail({
    required BuildContext context,
    required Tag tag,
  }) {
    showDialog(
      context: context,
      builder: (context) => TagDetailBody(tag),
    );
    // context.pushNamed(RouteName.tagDetail, pathParameters: {
    //   RouterParams.tagId: tag.docId,
    // });
  }

  static openTagEdit(BuildContext context, Tag tag) {
    showDialog(
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
