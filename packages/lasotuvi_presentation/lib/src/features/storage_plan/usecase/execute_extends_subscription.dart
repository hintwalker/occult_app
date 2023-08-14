import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../show_extends_confirm.dart';

Future<bool> executeExtendsSubscription({
  required BuildContext context,
  required Subscription subscription,
  required WidgetRef ref,
}) async {
  final result = await showExtendsConfirm(context, subscription);
  if (result) {
    await ref
        .read(planListNotifierProvider.notifier)
        .extendsCurrentSubscription(subscription);
    // await ref.read(currentPlanNotifierProvider.notifier).fetchData();
    return true;
  }
  return false;
}
