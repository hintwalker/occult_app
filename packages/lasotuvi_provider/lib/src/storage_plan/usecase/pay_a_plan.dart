import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

final payAPlanProvider = Provider(
  (ref) => PayAPlan(
    payEnergy: ref.read(
      payEnergyProvider,
    ),
    takeCurrentUser: ref.read(
      takeCurrentUserProvider,
    ),
  ),
);
