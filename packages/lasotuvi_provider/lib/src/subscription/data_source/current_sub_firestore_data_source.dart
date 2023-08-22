import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../../utils/check_network_status.dart';
import '../service/current_sub_firestore_service.dart';

final currentSubFirestoreDataSourceProvider =
    Provider.autoDispose<CurrentSubCloudDataSource>(
  (ref) => CurrentSubFirestoreDataSource(
      ref.watch(
        currentSubFirestoreServiceProvider,
      ),
      availableNetwork: ref.read(checkNetworkStatusProvider).call),
);
