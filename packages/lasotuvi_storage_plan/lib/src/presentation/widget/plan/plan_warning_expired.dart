import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:lasotuvi_storage_plan/src/features/plan/widget/extends_plan_button.dart';
import 'package:tauari_ui/tauari_ui.dart';

class PlanWariningExpired extends StatelessWidget {
  const PlanWariningExpired({
    super.key,
    required this.translate,
    required this.style,
    required this.canceledDate,
    required this.onExtendsButtonTap,
  });
  final String Function(String) translate;
  final DateTime canceledDate;
  final StoragePlanStyle style;
  final void Function() onExtendsButtonTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 242, 163, 55)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    translate('allOverloadDataWillBeDeletedAt'),
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  DateTimeWidget(
                    canceledDate,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  ExtendsPlanButton(
                      translate: translate, onTap: onExtendsButtonTap),
                ],
              ),
            ),
          ],
        ));
  }
}
