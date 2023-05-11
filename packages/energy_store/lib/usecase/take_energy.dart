part of energy_store;

class TakeEnergy {
  final EnergyRepository repository;
  const TakeEnergy(this.repository);
  Future<Energy> call(String uid) async {
    return await repository.doc(uid) ?? const Energy(0);
  }
}
