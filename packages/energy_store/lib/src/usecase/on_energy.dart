import '../entity/energy.dart';
import '../repository/energy_repository.dart';

class OnEnergy {
  final EnergyRepository repository;
  const OnEnergy(this.repository);
  Stream<Energy> call(String? uid) {
    if (uid == null) {
      return Stream.value(const Energy(0));
    }
    return repository.onDoc(uid).map((e) => e ?? const Energy(0));
  }
}
