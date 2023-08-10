import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';
// import 'package:lasotuvi_provider/lasotuvi_provider.dart';

abstract class AuthDependedState<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> {
  StreamSubscription? _streamSubscription;
  String? uid;
  bool findingUid = true;
  RegisterOnAuthStateChanged get registerOnAuthStateChanged;

  FutureOr<void> callbackAfterGetUser(String? uid) {}
  @override
  void initState() {
    super.initState();
    startListening();
  }

  void startListening() {
    _streamSubscription = registerOnAuthStateChanged.call((user) async {
      setState(() {
        uid = user.uidInFirestore;
        findingUid = false;
        callbackAfterGetUser(uid);
      });
      return user.uidInFirestore;
    }, () {
      setState(() {
        uid = null;
        findingUid = false;
        callbackAfterGetUser(uid);
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}
