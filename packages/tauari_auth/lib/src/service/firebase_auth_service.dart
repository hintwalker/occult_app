import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

import '../entity/user_entity.dart';
import '../entity/user_status.dart';
import '../mapper/user_from_credential.dart';
import '../mapper/user_from_firebase.dart';

class FirebaseAuthService {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;
  FirebaseAuthService({
    required this.googleSignIn,
    required this.firebaseAuth,
  });

  final updateTriggerController = StreamController<bool>.broadcast();

  Future<UserEntity?> signInRecoveryAttempt() async {
    final credential = await _getCredential();
    if (credential == null) return null;
    return signInWithCredential(credential);
  }

  Future<UserEntity?> signInWithCredential(
      AuthCredential authCredential) async {
    try {
      final credential =
          await firebaseAuth.signInWithCredential(authCredential);
      return userFromCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password');
        }
      }
      return null;
    }
  }

  Future<UserEntity?> signInWithEmail(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // await _storeCredential(credential.credential);

      return userFromCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password');
        }
      }
      return null;
    }
  }

  // Future<void> _storeCredential(AuthCredential? credential) async {
  //   if (credential == null) return;
  //   final box = await Hive.openBox('token');
  //   if (kDebugMode) {
  //     print(
  //         'providerId: ${credential.providerId}, signInMethod: ${credential.signInMethod}, accessToken: ${credential.accessToken}, token: ${credential.token}');
  //   }
  //   await box.put('lastSignIn', {
  //     'providerId': credential.providerId,
  //     'accessToken': credential.accessToken,
  //     'signInMethod': credential.signInMethod,
  //     'token': credential.token,
  //   });
  // }

  Future<AuthCredential?> _getCredential() async {
    final box = await Hive.openBox('token');
    final credential = box.get('lastSignIn');
    if (credential == null) return null;
    return AuthCredential(
      providerId: credential['providerId'],
      signInMethod: credential['signInMethod'],
      accessToken: credential['accessToken'],
      token: credential['token'],
    );
  }

  Future<UserEntity?> signInWithGoogle() async {
    // await googleSignIn.signOut();
    try {
      final signInAccount =
          await googleSignIn.signIn().catchError((onError) => null);
      if (signInAccount == null) {
        return null;
      }
      final googleAuth = await signInAccount.authentication;
      final oAcredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final credential = await firebaseAuth.signInWithCredential(oAcredential);
      // .onError((error, stackTrace) => false);
      // .catchError((onError) {});
      if (credential.user == null) return null;
      // await _storeCredential(credential.credential);
      return userFromCredential(credential);
    } on PlatformException catch (_) {
      return null;
    }
    // final user = tuviUserFromFirebaseUser(result.user!);
    // return user.copyWith(
    //     status: UserStatus.on, lastSeen: DateTime.now().toString());
  }

  Future<void> signOut() async {
    final isSignIn =
        await googleSignIn.isSignedIn().onError((error, stackTrace) => false);
    // .catchError((e) {
    //   if (kDebugMode) {
    //     print(e.toString());
    //   }
    // });
    if (isSignIn) {
      await googleSignIn.disconnect();
    }

    return firebaseAuth.signOut();
  }

  Stream<UserEntity?> authStateChanges() =>
      firebaseAuth.authStateChanges().map(userFromFirebase);

  StreamSubscription<UserEntity?> onAuthStateChanged(
    FutureOr<String> Function(UserEntity user) onSignIn,
    Function() onSignOut,
  ) {
    return firebaseAuth
        .authStateChanges()
        .map((user) => userFromFirebase(user))
        .listen((event) {
      if (event == null) {
        onSignOut();
      } else {
        final userEntity = event.copyWith(
          status: UserStatus.on,
          lastSeen: DateTime.now().millisecondsSinceEpoch,
        );
        onSignIn(userEntity);
      }
    });
  }

  UserEntity? currentUser() {
    if (firebaseAuth.currentUser == null) {
      return null;
    } else {
      return userFromFirebase(firebaseAuth.currentUser!)!.copyWith(
        status: UserStatus.on,
        lastSeen: DateTime.now().millisecondsSinceEpoch,
      );
    }
  }

  Stream<UserEntity?> onCurrentUser() {
    return firebaseAuth
        .authStateChanges()
        .distinct((a, b) => a?.email == b?.email)
        .map((user) => user == null ? null : userFromFirebase(user));
    //   late StreamController<UserEntity?> ctlr;
    //   StreamSubscription? triggerSubscription;
    //   FutureOr<void> sendUpdate() {
    //     final user = currentUser();
    //     if (!ctlr.isClosed) {
    //       ctlr.add(user);
    //     }
    //   }

    //   ctlr = StreamController<UserEntity?>(onListen: () {
    //     sendUpdate();
    //     triggerSubscription =
    //         updateTriggerController.stream.listen((_) {
    //       sendUpdate();
    //     });
    //   }, onCancel: () {
    //     triggerSubscription?.cancel();
    //   });
    //   return ctlr.stream;
  }
}
