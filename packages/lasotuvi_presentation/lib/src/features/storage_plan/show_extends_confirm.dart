import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../styles/storage_plan_style_impl.dart';

Future<bool> showExtendsConfirm(
    BuildContext context, Subscription subscription) async {
  final result = await showDialog<ConfirmResult>(
    context: context,
    builder: (ctx) => ExtendsConfirmDialog(
      subscription: subscription,
      translate: translate,
      energyIcon: const Icon(Icons.energy_savings_leaf_outlined),
      style: StoragePlanStyleImpl(),
    ),
  );
  return result?.yes ?? false;
}
