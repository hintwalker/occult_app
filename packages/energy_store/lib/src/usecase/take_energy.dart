import '../entity/energy.dart';
import '../repository/energy_cloud_repository.dart';

class TakeEnergy {
  final EnergyCloudRepository repository;
  const TakeEnergy(this.repository);
  Future<Energy> call(String? uid) async {
    if (uid == null) {
      return const Energy(0);
    }
    return await repository.doc(uid) ?? const Energy(0);
  }
}
