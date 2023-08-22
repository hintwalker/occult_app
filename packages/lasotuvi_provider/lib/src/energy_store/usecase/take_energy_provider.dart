import 'package:energy_store/energy_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/energy_cache_repository.dart';

final takeEnergyProvider = Provider.autoDispose<TakeEnergy>(
    (ref) => TakeEnergy(ref.read(energyCacheRepositoryProvider)));
