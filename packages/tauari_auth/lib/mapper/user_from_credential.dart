part of tauari_auth;

UserEntity? userFromCredential(UserCredential credential) {
  final user = userFromFirebase(credential.user!);
  if (user == null) return null;
  return user.copyWith(
      status: UserStatus.on, lastSeen: DateTime.now().millisecondsSinceEpoch);
}
