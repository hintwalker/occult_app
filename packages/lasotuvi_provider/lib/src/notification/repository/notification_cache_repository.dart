import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'notification_cloud_cache_repository.dart';
import 'notification_local_repository.dart';

final notificationCacheRepositoryProvider = Provider.autoDispose(
  (ref) => NotificationRepositoryImpl(
    localRepository: ref.read(notificationLocalRepositoryProvider),
    cloudRepository: ref.read(notificationCloudCacheRepositoryProvider),
  ),
);
