part of energy_store;

class PayEnergy {
  final EnergyRepository repository;
  const PayEnergy(this.repository);
  Future<Energy> call(String uid, int value) async {
    return await repository.subtractEnergy(uid, value);
  }
}
