import 'package:flutter/material.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart'
    show StoragePlanScreenBody;

class StoragePlanMarketScreen extends StatelessWidget {
  const StoragePlanMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Placeholder(
          fallbackHeight: 50.0,
        ),
        Expanded(child: StoragePlanScreenBody())
      ],
    );
  }
}
