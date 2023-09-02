import 'package:flutter/material.dart';

class ChartDivider extends StatelessWidget {
  const ChartDivider({
    super.key,
    required this.width,
  });
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2.0,
      width: width,
      child: const Divider(
        height: 4.0,
        thickness: 1.0,
        indent: 0.0,
        endIndent: 0.0,
      ),
    );
  }
}
