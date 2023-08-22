import 'package:either_dart/either.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/energy.dart';
import '../model/energy_model.dart';
import 'energy_cloud_repository.dart';

class EnergyFirestoreRepository
    extends CloudSingleDocRepositoryImpl<Energy, EnergyModel>
    implements EnergyCloudRepository {
  EnergyFirestoreRepository(super.cacheDataSource,
      {required super.onlineDataSource})
      : super(
          entityToModel: (entity) => EnergyModel.fromEntity(entity),
        );

  @override
  Future<Energy> plusEnergy(String uid, int energyValue,
      {required bool refresh}) async {
    final oldValue = await doc(uid) ?? const Energy(0);
    final newValue = Energy(oldValue.value + energyValue);
    await update(uid, newValue, refresh);
    return newValue;
  }

  @override
  Future<Either<Energy, bool>> subtractEnergy(String uid, int energyValue,
      {required bool refresh}) async {
    final oldValue = await doc(uid);
    if (oldValue == null) {
      return const Right(false);
    }
    if (oldValue.value < energyValue) {
      return const Right(false);
    }
    final newValue = Energy(oldValue.value - energyValue);
    final result = await update(
      uid,
      newValue,
      refresh,
    );
    if (result == false) {
      return const Right(false);
    }
    return Left(newValue);
  }
}
