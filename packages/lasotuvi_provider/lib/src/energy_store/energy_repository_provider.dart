import 'package:energy_store/energy_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'energy_data_source_provider.dart';

final energyRepositoryProvider = Provider.autoDispose<EnergyRepository>((ref) =>
    EnergyRepositoryImpl(ref.read(energyDataSourceProvider),
        entityToModel: (entity) => EnergyModel.fromEntity(entity)));
