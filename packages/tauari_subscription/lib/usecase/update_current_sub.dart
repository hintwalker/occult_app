part of tauari_subscription;

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
