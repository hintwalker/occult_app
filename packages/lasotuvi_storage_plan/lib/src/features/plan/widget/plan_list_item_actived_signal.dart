import 'package:flutter/material.dart';

class PlanListItemActivedSignal extends StatelessWidget {
  const PlanListItemActivedSignal({
    super.key,
    required this.translate,
    this.backgroundColor,
    this.textStyle,
  });
  final String Function(String) translate;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Text(
        translate('using'),
        style: textStyle,
      ),
    );
  }
}
