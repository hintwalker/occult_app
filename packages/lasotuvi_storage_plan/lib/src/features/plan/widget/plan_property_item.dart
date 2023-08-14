import 'package:flutter/material.dart';

class PlanPropertyItem extends StatelessWidget {
  const PlanPropertyItem({
    super.key,
    required this.limitCount,
    required this.title,
    required this.iconColor,
    required this.benifitStyle,
    required this.propertyIcon,
  });
  final int limitCount;
  final String title;
  final Color? iconColor;
  final TextStyle? benifitStyle;
  final Widget? propertyIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          // Row(
          //   children: [
          Icon(
        Icons.done,
        color: iconColor,
      ),
      //   if (propertyIcon != null)
      //     const SizedBox(
      //       width: 4.0,
      //     ),
      //   if (propertyIcon != null) propertyIcon!,
      // ],
      // ),
      title: Text(
        '$limitCount $title',
        style: benifitStyle,
      ),
    );
  }
}
