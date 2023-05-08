part of lasotuvi_domain;

class PayEnergy {
  final EnergyRepository repository;
  const PayEnergy(this.repository);
  Future<bool> call(String uid, int value) async {
    return await repository.subtractEnergy(uid, value);
  }
}
