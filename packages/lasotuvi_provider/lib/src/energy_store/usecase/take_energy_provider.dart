import 'package:energy_store/energy_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../energy_repository_provider.dart';

final takeEnergyProvider = Provider.autoDispose<TakeEnergy>(
    (ref) => TakeEnergy(ref.read(energyRepositoryProvider)));
