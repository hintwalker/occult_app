import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:lasotuvi_storage_plan/src/features/subscription_confirm/widget/small_plan_property_item.dart';

class PlanDetail extends StatelessWidget {
  const PlanDetail({
    super.key,
    required this.countChart,
    required this.countNote,
    required this.countTag,
    required this.plan,
    required this.translate,
    required this.icon,
    required this.overlay,
    required this.style,
  });
  final String Function(String) translate;
  final int countChart;
  final int countTag;
  final int countNote;
  final StoragePlan plan;
  final Widget icon;
  final bool overlay;
  final SubscriptionConfirmStyle style;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: overlay ? 0.0 : null,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon,
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  SmallPlanPropertyItem(
                    icon: Icons.badge,
                    title: translate('chart'),
                    value: countChart,
                    maxValue: plan.limitChart,
                    style: style,
                  ),
                  SmallPlanPropertyItem(
                    icon: Icons.label,
                    title: translate('tag'),
                    value: countTag,
                    maxValue: plan.limitTag,
                    style: style,
                  ),
                  SmallPlanPropertyItem(
                    icon: Icons.sticky_note_2,
                    title: translate('note'),
                    value: countNote,
                    maxValue: plan.limitNote,
                    style: style,
                  ),
                ],
              ),
            ),
            if (overlay)
              Positioned.fill(
                  child: Container(
                decoration: BoxDecoration(
                  color: style.overlayColor,
                  borderRadius: BorderRadius.circular(12),
                ),
              ))
          ],
        ));
  }
}
