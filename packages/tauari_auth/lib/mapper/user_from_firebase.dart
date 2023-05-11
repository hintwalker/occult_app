part of tauari_auth;

UserEntity? userFromFirebase(User? user) {
  if (user == null) return null;
  return UserEntity(
      id: user.uid,
      displayName: user.displayName ?? '',
      email: user.email ?? '',
      photoUrl: user.photoURL);
}
