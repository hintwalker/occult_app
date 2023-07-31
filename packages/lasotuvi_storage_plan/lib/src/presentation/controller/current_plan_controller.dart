import 'package:flutter/material.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

class CurrentPlanController extends ChangeNotifier {
  CurrentPlanController({
    required this.subController,
  });
  final CurrentSubController subController;
}
