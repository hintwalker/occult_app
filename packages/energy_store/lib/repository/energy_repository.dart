part of energy_store;

abstract class EnergyRepository extends CloudSingleDocRepository<Energy> {
  Future<Energy> plusEnergy(String uid, int energyValue);
  Future<Energy> subtractEnergy(String uid, int energyValue);
}
