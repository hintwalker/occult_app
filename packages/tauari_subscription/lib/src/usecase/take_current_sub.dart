import '../entity/subscription.dart';
import '../repository/current_sub_repository.dart';

class TakeCurrentSub {
  final CurrentSubRepository repository;
  const TakeCurrentSub(this.repository);

  Future<Subscription?> call(String? uid) async {
    if (uid == null) {
      return Future.value(null);
    }
    return await repository.doc(uid);
  }
}
