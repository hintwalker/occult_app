import 'package:either_dart/either.dart';
import 'package:energy_store/energy_store.dart';
import 'package:tauari_auth/tauari_auth.dart';

class PayAPlan {
  const PayAPlan({
    required this.payEnergy,
    required this.takeCurrentUser,
  });
  final PayEnergy payEnergy;
  final TakeCurrentUser takeCurrentUser;
  Future<Either<Energy, bool>> call(int amount) async {
    final user = takeCurrentUser();
    if (user == null) {
      return const Right(false);
    }
    return await payEnergy.call(user.uidInFirestore, amount);
  }
}
