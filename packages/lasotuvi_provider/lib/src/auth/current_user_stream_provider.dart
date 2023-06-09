import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import 'auth_repository_provider.dart';

final currentUserStreamProvider = StreamProvider.autoDispose((ref) {
  final controller = StreamController<UserEntity?>.broadcast();
  final sub = ref.watch(authRepositoryProvider).onCurrentUser().listen((event) {
    controller.add(event);
  });
  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });
  return controller.stream;
});
