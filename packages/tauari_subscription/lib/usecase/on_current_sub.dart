part of tauari_subscription;

class OnCurrentSub {
  final CurrentSubRepository repository;
  const OnCurrentSub(this.repository);

  Stream<Subscription?> call(String? uid) =>
      uid == null ? Stream.value(null) : repository.onDoc(uid);
}
