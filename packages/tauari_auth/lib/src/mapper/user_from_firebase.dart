import 'package:firebase_auth/firebase_auth.dart';

import '../entity/user_entity.dart';

UserEntity? userFromFirebase(User? user) {
  if (user == null) return null;
  return UserEntity(
      id: user.uid,
      displayName: user.displayName ?? '',
      email: user.email ?? '',
      photoUrl: user.photoURL);
}
