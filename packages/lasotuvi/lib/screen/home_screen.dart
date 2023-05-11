import 'package:flutter/material.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart'
    show HomeScreenBody;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Placeholder(
          fallbackHeight: 50.0,
        ),
        HomeScreenBody()
      ],
    );
  }
}
