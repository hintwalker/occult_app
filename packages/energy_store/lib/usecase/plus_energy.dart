part of energy_store;

class PlusEnergy {
  final EnergyRepository repository;
  const PlusEnergy(this.repository);

  Future<Energy> call(String uid, int value) =>
      repository.plusEnergy(uid, value);
}
