import '../entity/subscription.dart';
import '../repository/current_sub_repository.dart';

class OnCurrentSub {
  final CurrentSubRepository repository;
  const OnCurrentSub(this.repository);

  Stream<Subscription?> call(String? uid) =>
      uid == null ? Stream.value(null) : repository.onDoc(uid);
}
