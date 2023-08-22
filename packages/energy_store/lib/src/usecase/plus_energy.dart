import '../entity/energy.dart';
import '../repository/energy_cloud_repository.dart';

class PlusEnergy {
  final EnergyCloudRepository cacheRepository;
  // final EnergyCloudRepository cloudRepository;
  const PlusEnergy({
    required this.cacheRepository,
    // required this.cloudRepository,
  });

  Future<Energy> call(String uid, int value) async {
    final result = await cacheRepository.plusEnergy(uid, value, refresh: true);
    // await cloudRepository.plusEnergy(uid, value, refresh: false);
    return result;
  }
}
