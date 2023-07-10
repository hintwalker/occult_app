import 'package:flutter/material.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';

class AllTagsScreen extends StatelessWidget {
  const AllTagsScreen({
    super.key,
    this.restorationId,
  });
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
        restorationId: restorationId,
        child: Container(
          color: LasotuviAppStyle.colorScheme.background,
          child: const Placeholder(),
        ));
  }
}
