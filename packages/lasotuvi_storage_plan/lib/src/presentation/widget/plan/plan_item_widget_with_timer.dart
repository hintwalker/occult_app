import 'package:flutter/material.dart';

class PlanItemWidgetWithTimer extends StatelessWidget {
  const PlanItemWidgetWithTimer({
    super.key,
    required this.title,
    required this.price,
    required this.property,
    required this.action,
    required this.timerTitle,
    required this.timerValue,
    this.cancelExtendsText,
  });
  final Widget title;
  final Widget price;
  final Widget property;
  final Widget timerTitle;
  final Widget timerValue;
  final Widget? cancelExtendsText;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              title,
              price,
              property,
              const SizedBox(
                height: 12.0,
              ),
              const Divider(
                height: 1.0,
                thickness: 1.0,
              ),
              const SizedBox(
                height: 8.0,
              ),
              timerTitle,
              timerValue,
              const SizedBox(
                height: 8.0,
              ),
              if (cancelExtendsText != null) cancelExtendsText!,
              const SizedBox(
                height: 8.0,
              ),
              const Divider(
                height: 1.0,
                thickness: 1.0,
              ),
              const SizedBox(
                height: 8.0,
              ),
              action,
            ]),
      ),
    );
  }
}
