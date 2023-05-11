part of tauari_auth;

class FirebaseAuthDataSource extends AuthDataSource {
  final FirebaseAuthService service;
  final updateTriggerController = StreamController<bool>.broadcast();
  FirebaseAuthDataSource(this.service);
  @override
  Future<UserEntity?> signInWithGoole() => service.signInWithGoogle();

  @override
  Future<void> signOut() => service.signOut();

  @override
  StreamSubscription<UserEntity?> onAuthStateChanged(
          Future<String> Function(UserEntity user) onSignIn,
          Function() onSignOut) =>
      service.onAuthStateChanged(onSignIn, onSignOut);

  @override
  UserEntity? currentUser() => service.currentUser();

  @override
  Future<UserEntity?> signInRecoveryAttempt() =>
      service.signInRecoveryAttempt();
  @override
  Stream<UserEntity?> authStateChanges() => service.authStateChanges();

  @override
  Stream<UserEntity?> onCurrentUser() {
    return service.onCurrentUser();
    // late StreamController<UserEntity?> ctlr;
    // StreamSubscription? triggerSubscription;
    // Future<void> sendUpdate() async {
    //   final items = service.currentUser();
    //   if (!ctlr.isClosed) {
    //     ctlr.add(items);
    //   }
    // }

    // ctlr = StreamController<UserEntity?>(onListen: () {
    //   sendUpdate();
    //   triggerSubscription = updateTriggerController.stream.listen((_) {
    //     sendUpdate();
    //   });
    // }, onCancel: () {
    //   triggerSubscription?.cancel();
    // });
    // return ctlr.stream;
  }
}
