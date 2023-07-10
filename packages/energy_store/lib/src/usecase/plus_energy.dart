import '../entity/energy.dart';
import '../repository/energy_repository.dart';

class PlusEnergy {
  final EnergyRepository repository;
  const PlusEnergy(this.repository);

  Future<Energy> call(String uid, int value) =>
      repository.plusEnergy(uid, value);
}
