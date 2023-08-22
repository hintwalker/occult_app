import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../service/energy_cache_service.dart';

final refreshEnergyCloudProvider = Provider(
  (ref) => RefreshCache(
    ref.read(
      energyCacheServiceProvider,
    ),
  ),
);
