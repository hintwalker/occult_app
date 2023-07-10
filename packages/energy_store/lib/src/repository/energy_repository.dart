import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/energy.dart';

abstract class EnergyRepository extends CloudSingleDocRepository<Energy> {
  Future<Energy> plusEnergy(String uid, int energyValue);
  Future<Energy> subtractEnergy(String uid, int energyValue);
}
