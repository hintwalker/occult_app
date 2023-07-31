import 'package:either_dart/either.dart';
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
  Future<Either<Energy, bool>> subtractEnergy(
      String uid, int energyValue) async {
    final oldValue = await doc(uid);
    if (oldValue == null) {
      return const Right(false);
    }
    if (oldValue.value < energyValue) {
      return const Right(false);
    }
    final newValue = Energy(oldValue.value - energyValue);
    final result = await update(uid, newValue);
    if (result == false) {
      return const Right(false);
    }
    return Left(newValue);
  }
}
