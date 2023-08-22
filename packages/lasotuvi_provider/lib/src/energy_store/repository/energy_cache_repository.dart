import 'package:energy_store/energy_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';

import '../data_source/energy_cache_data_source.dart';

final energyCacheRepositoryProvider =
    Provider.autoDispose<EnergyCloudRepository>(
  (ref) => EnergyFirestoreRepository(
    ref.read(energyCacheDataSourceProvider),
    onlineDataSource: ref.read(energyFirestoreDataSourceProvider),
  ),
);
