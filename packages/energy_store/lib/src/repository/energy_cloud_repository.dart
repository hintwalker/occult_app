import 'package:either_dart/either.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/energy.dart';

abstract class EnergyCloudRepository extends CloudSingleDocRepository<Energy> {
  Future<Energy> plusEnergy(String uid, int energyValue,
      {required bool refresh});
  Future<Either<Energy, bool>> subtractEnergy(String uid, int energyValue,
      {required bool refresh});
}
