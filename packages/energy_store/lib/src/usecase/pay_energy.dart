import 'package:either_dart/either.dart';

import '../entity/energy.dart';
import '../repository/energy_cloud_repository.dart';

class PayEnergy {
  final EnergyCloudRepository cacheRepository;
  // final EnergyCloudRepository cloudRepository;
  const PayEnergy({
    required this.cacheRepository,
    // required this.cloudRepository,
  });
  Future<Either<Energy, bool>> call(String uid, int value) async {
    final result =
        await cacheRepository.subtractEnergy(uid, value, refresh: true);
    // await cloudRepository.subtractEnergy(uid, value, refresh: false);
    return result;
  }
}
