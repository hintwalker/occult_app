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
      decoration: BoxDecoration(color: Colors.blueGrey.shade100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  translate('allOverloadDataDeletedAt'),
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.blueGrey.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
                DateTimeWidget(canceledDate,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.blueGrey.shade700,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
