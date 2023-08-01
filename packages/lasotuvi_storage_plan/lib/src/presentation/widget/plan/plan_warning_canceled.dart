import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_ui/tauari_ui.dart';

class PlanWariningCanceled extends StatelessWidget {
  const PlanWariningCanceled({
    super.key,
    required this.translate,
    required this.style,
    required this.canceledDate,
  });
  final String Function(String) translate;
  final DateTime canceledDate;
  final StoragePlanStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(color: Color.fromARGB(255, 230, 41, 44)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                translate('allOverloadDataDeletedAt'),
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              DateTimeWidget(canceledDate,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
