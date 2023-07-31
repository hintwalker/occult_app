import 'package:either_dart/either.dart';

import '../entity/energy.dart';
import '../repository/energy_repository.dart';

class PayEnergy {
  final EnergyRepository repository;
  const PayEnergy(this.repository);
  Future<Either<Energy, bool>> call(String uid, int value) async {
    return await repository.subtractEnergy(uid, value);
  }
}
