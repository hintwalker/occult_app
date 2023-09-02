import 'dart:async';

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:tauari_auth/tauari_auth.dart';

class AuthController extends ChangeNotifier {
  AuthController({
    required this.onCurrentUser,
    required this.registerOnAuthStateChanged,
    required this.setupInitUser,
  });
  final OnCurrentUser onCurrentUser;
  final RegisterOnAuthStateChanged registerOnAuthStateChanged;
  final SetupInitUser setupInitUser;

  final StreamController<UserEntity?> _streamController =
      StreamController<UserEntity?>.broadcast();
  StreamSubscription<UserEntity?>? _subscription;

  StreamSubscription<UserEntity?>? _onChangedSubscription;

  void register(Future<void> Function(String uid)? syncData) {
    _onChangedSubscription = registerOnAuthStateChanged.call((user) async {
      final savedUser = await setupInitUser(user);
      if (kDebugMode) {
        print('Signed in: ${user.displayName} with uid = $savedUser');
      }
      if (syncData != null) {
        await syncData(savedUser);
      }

      // await ref.read(syncChartsProvider)(savedUser);
      // await ref.read(syncTagsProvider)(savedUser);
      // await ref.read(syncNotesProvider)(savedUser);
      // await ref.read(syncChartTagsProvider)(savedUser);
      return savedUser;
    }, () {
      if (kDebugMode) {
        print('Signed out!');
      }
    });
  }

  Stream<UserEntity?> stream() {
    // _streamController = StreamController<UserEntity?>.broadcast();
    listen();
    return _streamController.stream;
  }

  void listen() {
    _subscription = onCurrentUser().listen((event) {
      if (!_streamController.isClosed) {
        _streamController.add(event);
      }
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
