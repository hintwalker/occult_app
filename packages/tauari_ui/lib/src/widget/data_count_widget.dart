import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class DataCountWidget extends StatelessWidget {
  const DataCountWidget({
    super.key,
    required this.uid,
    required this.controller,
  });
  final String? uid;
  final CountEveryWhereController controller;

  @override
  Widget build(BuildContext context) {
    return BasicStreamBuilder(
      stream: controller.stream(uid),
      child: (count) => Text('($count)'),
    );
  }
}
