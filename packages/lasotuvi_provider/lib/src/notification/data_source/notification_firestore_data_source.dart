import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../../utils/check_network_status.dart';
import '../service/notification_firestore_service.dart';

final notificationFirestoreDataSourceProvider =
    Provider.autoDispose<NotificationCloudDataSource>(
  (ref) => NotificationFirestoreDataSource(
    ref.read(notificationFirestoreServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
