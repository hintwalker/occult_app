import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_date_format/tauari_date_format.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

class CurrentPlanExpiredDate extends StatelessWidget {
  const CurrentPlanExpiredDate({
    super.key,
    required this.subscription,
    required this.translate,
    required this.hasExpired,
    this.style,
  });
  final Subscription? subscription;
  final String Function(String) translate;
  final CurrentPlanStyle? style;
  final bool hasExpired;

  @override
  Widget build(BuildContext context) {
    return subscription == null || subscription?.planId == StoragePlanIds.free
        ? const SizedBox.shrink()
        : Column(
            children: [
              const SizedBox(
                height: 2.0,
              ),
              hasExpired
                  ? Text(translate('expired'), style: style?.expiredText)
                  : Text(
                      '${translate('expiredDate')}: ${subscription!.expiredDate.toStringVn()}',
                      style: style?.expiredDate,
                    ),
              const SizedBox(
                height: 2.0,
              ),
              Text(
                '${translate('canceledDate')}: ${subscription!.expiredDate.add(TimeConfig.cancelDuration).toStringVn()}',
                style: style?.expiredDate,
              ),
              const SizedBox(
                height: 2.0,
              ),
              if (hasExpired)
                Text(
                  translate('warningDeleteOverloadData'),
                  style: style?.deleteDataWarning,
                )
              // const Divider(
              //   height: 1.0,
              //   thickness: 1.0,
              // ),
            ],
          );
  }
}
