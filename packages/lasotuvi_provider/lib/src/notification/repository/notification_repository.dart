import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import 'cloud_notification_repository.dart';
import 'local_notification_repository.dart';

final notificationRepositoryProvider = Provider.autoDispose((ref) =>
    NotificationRepositoryImpl(
        localRepository: ref.read(localNotificationRepositoryProvider),
        cloudRepository: ref.read(cloudNotificationRepositoryProvider)));
