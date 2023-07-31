import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

class ActivedRibbon extends StatelessWidget {
  const ActivedRibbon({
    super.key,
    required this.translate,
    required this.style,
  });
  final String Function(String) translate;
  final StoragePlanStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: style.activedRibbonBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Text(
        translate('using'),
        style: TextStyle(
          color: style.activedRibbonTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
