import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';
import '../state/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier({
    required this.onCurrentUser,
    required this.registerOnAuthStateChanged,
    required this.setupInitUser,
  }) : super(const UserState.initial());
  final OnCurrentUser onCurrentUser;
  final RegisterOnAuthStateChanged registerOnAuthStateChanged;
  final SetupInitUser setupInitUser;

  StreamSubscription<UserEntity?>? _onChangedSubscription;
  final StreamController<UserEntity?> _streamController =
      StreamController<UserEntity?>.broadcast();
  StreamSubscription<UserEntity?>? _subscription;

  void listen() {
    _subscription = onCurrentUser().listen((event) {
      state = state.copyWith(
        data: event,
        workingState: UserWorkingState.success,
      );
      if (!_streamController.isClosed) {
        _streamController.add(event);
      }
    });
  }

  Stream<UserEntity?> currentUser() {
    // _streamController = StreamController<UserEntity?>.broadcast();
    listen();
    return _streamController.stream;
  }

  void startListening({required void Function(String uid) onSignIn}) {
    // try {
    //   _streamSubscription?.cancel();
    // } catch (_) {}

    _onChangedSubscription = registerOnAuthStateChanged.call((user) async {
      if (kDebugMode) {
        print(
            'Signed in: ${user.displayName} with uid = ${user.uidInFirestore}');
      }
      state = state.copyWith(
        data: user,
        workingState: UserWorkingState.success,
      );
      onSignIn(user.uidInFirestore);
      // setState(() {
      //   uid = user.uidInFirestore;
      //   findingUid = false;
      //   callbackAfterGetUser(uid);
      // });
      return user.uidInFirestore;
    }, () {
      state = state.copyWith(
        data: null,
        forceSetData: true,
        workingState: UserWorkingState.success,
      );
      if (kDebugMode) {
        print('Signed out!');
      }
      // setState(() {
      //   uid = null;
      //   findingUid = false;
      //   callbackAfterGetUser(uid);
      // });
    });
  }

  @override
  void dispose() {
    unregister();
    super.dispose();
  }

  void unregister() {
    _subscription?.cancel();
    _streamController.close();
    _onChangedSubscription?.cancel();
  }
}
