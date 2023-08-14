import 'package:flutter/material.dart';

class CurrentPlanTitle extends StatelessWidget {
  const CurrentPlanTitle({
    super.key,
    required this.translate,
    this.style,
  });
  final String Function(String) translate;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      translate('storagePlan'),
      style: style,
    );
  }
}
