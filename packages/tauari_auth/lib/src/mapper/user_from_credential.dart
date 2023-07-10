import 'package:firebase_auth/firebase_auth.dart';
import '../entity/user_entity.dart';
import '../entity/user_status.dart';
import 'user_from_firebase.dart';

UserEntity? userFromCredential(UserCredential credential) {
  final user = userFromFirebase(credential.user!);
  if (user == null) return null;
  return user.copyWith(
      status: UserStatus.on, lastSeen: DateTime.now().millisecondsSinceEpoch);
}
