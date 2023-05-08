part of lasotuvi_domain;

abstract class EnergyRepository extends CloudSingleDocRepository<Energy> {
  Future<void> plusEnergy(String uid, int energyValue);
  Future<bool> subtractEnergy(String uid, int energyValue);
}
