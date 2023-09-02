import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import '../data_source/firebase_auth_provider.dart';

final authServiceProvider = Provider<FirebaseAuthService>(
  (ref) => FirebaseAuthService(
    googleSignIn: GoogleSignIn(scopes: [
      'email',
    ]), // 'https://www.googleapis.com/auth/contacts.readonly']),
    firebaseAuth: ref.read(firebaseAuthProvider),
  ),
);
