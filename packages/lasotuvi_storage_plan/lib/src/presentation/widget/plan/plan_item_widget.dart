import 'package:flutter/material.dart';

class PlanItemWidget extends StatelessWidget {
  const PlanItemWidget({
    super.key,
    required this.title,
    required this.price,
    required this.property,
    this.action,
  });
  final Widget title;
  final Widget price;
  final Widget property;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 24.0,
              ),
              title,
              price,
              property,
              if (action != null)
                const SizedBox(
                  height: 12.0,
                ),
              if (action != null)
                const Divider(
                  height: 1.0,
                  thickness: 1.0,
                ),
              if (action != null)
                const SizedBox(
                  height: 8.0,
                ),
              if (action != null) action!,
            ]),
      ),
    );
  }
}
