import 'package:energy_store/energy_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';

final payEnergyProvider = Provider.autoDispose<PayEnergy>(
  (ref) => PayEnergy(
    ref.read(
      energyRepositoryProvider,
    ),
  ),
);
