import '../repository/energy_cloud_repository.dart';

class EnoughEnergy {
  const EnoughEnergy(this.repository);
  final EnergyCloudRepository repository;
  Future<bool> call(String? uid, int checkValue) async {
    if (uid == null) {
      return Future.value(false);
    }
    final currentEnergy = await repository.doc(uid);
    if (currentEnergy == null) {
      return Future.value(false);
    }
    return currentEnergy.value >= checkValue;
  }
}
