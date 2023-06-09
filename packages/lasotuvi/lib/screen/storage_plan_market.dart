import 'package:flutter/material.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart'
    show StoragePlanScreenBody;

class StoragePlanMarketScreen extends StatelessWidget {
  const StoragePlanMarketScreen({
    super.key,
    this.restorationId,
  });
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
        restorationId: restorationId,
        child: const Column(
          children: [
            Placeholder(
              fallbackHeight: 50.0,
            ),
            Expanded(child: StoragePlanScreenBody())
          ],
        ));
  }
}
