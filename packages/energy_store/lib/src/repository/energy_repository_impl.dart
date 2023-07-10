import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/energy.dart';
import '../model/energy_model.dart';
import 'energy_repository.dart';

class EnergyRepositoryImpl
    extends CloudSingleDocRepositoryImpl<Energy, EnergyModel>
    implements EnergyRepository {
  EnergyRepositoryImpl(super.dataSource, {required super.entityToModel});

  @override
  Future<Energy> plusEnergy(String uid, int energyValue) async {
    final oldValue = await doc(uid) ?? const Energy(0);
    final newValue = Energy(oldValue.value + energyValue);
    await update(uid, newValue);
    return newValue;
  }

  @override
  Future<Energy> subtractEnergy(String uid, int energyValue) async {
    final oldValue = await doc(uid) ?? const Energy(0);
    if (oldValue.value < energyValue) {
      return oldValue;
    }
    final newValue = Energy(oldValue.value - energyValue);
    await update(uid, newValue);
    return newValue;
  }
}
