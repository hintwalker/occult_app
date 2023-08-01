import 'package:flutter/material.dart';
import '../../style/storage_plan_style.dart';
import '../actived_ribbon.dart';

class ActivedPlanWidget extends StatelessWidget {
  const ActivedPlanWidget({
    super.key,
    required this.translate,
    required this.style,
    required this.child,
  });
  final Widget child;
  final String Function(String) translate;
  // final ColorScheme colorScheme;
  final StoragePlanStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: style.activedRibbonBackground,
                width: 4.0,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            child: child,
          ),
          Positioned(
            child: ActivedRibbon(
              translate: translate,
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}
