import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    this.size = 28.0,
    required this.fillColor,
    required this.borderColor,
    required this.child,
  });
  final double size;
  final Color fillColor;
  final Color borderColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: borderColor, // border color
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2), // border width
        child: Container(
          // or ClipRRect if you need to clip the content
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: fillColor, // inner circle color
          ),
          child: child, // inner content
        ),
      ),
    );
  }
}
