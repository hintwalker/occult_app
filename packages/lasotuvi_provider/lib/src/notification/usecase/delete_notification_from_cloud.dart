import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
// import 'package:lasotuvi_provider/src/notification/repository/notification_cloud_firestore_repository.dart';

import '../repository/notification_cloud_cache_repository.dart';

final deleteNotificationFromCloudProvider =
    Provider.autoDispose<DeleteNotificationFromCloud>(
  (ref) => DeleteNotificationFromCloud(
    cacheRepository: ref.read(notificationCloudCacheRepositoryProvider),
    // cloudRepository: ref.read(notificationCloudFirestoreRepositoryProvider),
  ),
);
