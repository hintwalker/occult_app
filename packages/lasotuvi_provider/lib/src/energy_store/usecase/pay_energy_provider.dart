import 'package:energy_store/energy_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';

// import '../repository/energy_firestore_repository.dart';

final payEnergyProvider = Provider.autoDispose<PayEnergy>(
  (ref) => PayEnergy(
    cacheRepository: ref.read(
      energyCacheRepositoryProvider,
    ),
    // cloudRepository: ref.read(energyFirestoreRepositoryProvider),
  ),
);
