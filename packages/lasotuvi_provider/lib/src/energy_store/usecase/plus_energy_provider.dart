import 'package:energy_store/energy_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/energy_cache_repository.dart';
// import '../repository/energy_firestore_repository.dart';

final plusEnergyProvider = Provider.autoDispose<PlusEnergy>(
  (ref) => PlusEnergy(
    cacheRepository: ref.read(energyCacheRepositoryProvider),
    // cloudRepository: ref.read(energyFirestoreRepositoryProvider),
  ),
);
