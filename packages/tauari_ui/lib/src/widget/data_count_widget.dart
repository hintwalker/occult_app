import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class DataCountWidget extends StatelessWidget {
  const DataCountWidget(
      {super.key,
      required this.uid,
      required this.controller,
      required this.colorScheme});
  final String? uid;
  final CountEveryWhereController controller;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return BasicStreamBuilder(
      stream: controller.stream(uid),
      child: (count) =>
          Text('($count)', style: TextStyle(color: colorScheme.primary)),
    );
  }
}
