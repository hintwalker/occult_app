import 'package:energy_store/energy_store.dart';

import '../mapper/cache_to_model.dart';

class EnergyCacheDataSource extends EnergyDataSource {
  EnergyCacheDataSource(
    super.service, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) =>
              cacheToModel(snapshot, fromMap: EnergyModel.fromMap),
        );
}
