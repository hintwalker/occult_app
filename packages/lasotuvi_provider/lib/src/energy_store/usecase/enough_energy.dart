import 'package:energy_store/energy_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';

final enoughEnergyProvider = Provider.autoDispose<EnoughEnergy>(
  (ref) => EnoughEnergy(
    ref.read(
      energyRepositoryProvider,
    ),
  ),
);
