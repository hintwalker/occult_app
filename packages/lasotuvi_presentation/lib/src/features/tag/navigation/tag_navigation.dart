import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../checkbox_tag_list_body.dart';
import '../tag_creation_body.dart';
import '../tag_detail_body.dart';
import '../tag_edit_body.dart';

class TagNavigation {
  static void openTagCreationScreen(
    BuildContext context,
    void Function(Tag tag)? doAfterCreation,
  ) {
    showDialog(
      context: context,
      builder: (context) => TagCreationBody(doAfterCreation: doAfterCreation),
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
