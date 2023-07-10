import '../entity/subscription.dart';
import '../repository/current_sub_repository.dart';

class UpdateCurrentSub {
  final CurrentSubRepository repository;
  const UpdateCurrentSub(this.repository);

  Future<bool> call(String? uid, Subscription sub) async {
    if (uid == null) {
      return Future.value(false);
    }
    return repository.update(uid, sub);
  }
}
