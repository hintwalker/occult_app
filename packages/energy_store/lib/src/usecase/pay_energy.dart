import '../entity/energy.dart';
import '../repository/energy_repository.dart';

class PayEnergy {
  final EnergyRepository repository;
  const PayEnergy(this.repository);
  Future<Energy> call(String uid, int value) async {
    return await repository.subtractEnergy(uid, value);
  }
}
