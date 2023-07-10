import 'package:flutter/material.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart'
    show AllStoragePlansBody;
import 'package:lasotuvi_style/lasotuvi_style.dart';

class AllStoragePlansScreen extends StatelessWidget {
  const AllStoragePlansScreen({
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
        child: const Column(
          children: [
            Placeholder(
              fallbackHeight: 50.0,
            ),
            Expanded(child: AllStoragePlansBody())
          ],
        ),
      ),
    );
  }
}
