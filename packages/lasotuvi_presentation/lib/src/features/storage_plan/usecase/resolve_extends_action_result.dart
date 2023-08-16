import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

Future<bool> resolveExtendsActionResult({
  required BuildContext context,
  required ExtendsPlanActionResult result,
}) async {
  if (result == ExtendsPlanActionResult.success) {
    return true;
  } else if (result == ExtendsPlanActionResult.notEnoughEnergy) {
    if (context.mounted) {
      await showDialog(
        context: context,
        builder: (ctx) => const NoteEnoughEnergyDialog(translate: translate),
      );
    } else if (result == ExtendsPlanActionResult.noConnection) {
      await showDialog(
        context: context,
        builder: (ctx) => const NetworkNotConnectedAlertDialog(
          colorScheme: LasotuviAppStyle.colorScheme,
          translate: translate,
        ),
      );
    }
  }
  return false;
}
