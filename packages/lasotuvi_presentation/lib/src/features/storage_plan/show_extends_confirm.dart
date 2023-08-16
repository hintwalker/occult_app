import 'package:flutter/material.dart';
import 'package:lasotuvi_presentation/src/styles/subscription_confirm_style_impl.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

Future<bool> showExtendsConfirm(
    BuildContext context, Subscription subscription) async {
  final style =
      SubscriptionConfirmStyleImpl.apply(LasotuviAppStyle.colorScheme);
  final result = await showDialog<ConfirmResult>(
    context: context,
    builder: (ctx) => ExtendsConfirmDialog(
      subscription: subscription,
      translate: translate,
      energyIcon: Icon(
        Icons.energy_savings_leaf_outlined,
        color: style.energyIconColor,
        size: 24,
      ),
      iconColor: style.energyIconColor,
      priceValueTextStyle: style.billingValueTextStyle?.copyWith(fontSize: 24),
      titleStyle: style.billingTitleTextStyle?.copyWith(fontSize: 24),
      periodTextStyle: style.billingValueTextStyle?.copyWith(fontSize: 24),
    ),
  );
  return result?.yes ?? false;
}
