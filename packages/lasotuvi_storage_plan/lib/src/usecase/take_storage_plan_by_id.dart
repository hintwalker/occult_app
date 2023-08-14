import 'package:tauari_auth/tauari_auth.dart';

import '../entity/storage_plan.dart';
import '../repository/storage_plan_repository.dart';

class TakeStoragePlanById {
  final StoragePlanRepository repository;
  final TakeCurrentUser takeCurrentUser;
  const TakeStoragePlanById({
    required this.repository,
    required this.takeCurrentUser,
  });
  Future<StoragePlan?> call(String planId) async {
    final user = takeCurrentUser();
    return user == null
        ? null
        : await repository.byIdOnCloud(uid: user.uidInFirestore, docId: planId);
  }
}
