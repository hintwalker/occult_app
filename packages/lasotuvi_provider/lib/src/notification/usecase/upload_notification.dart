import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/notification_cache_repository.dart';
// import '../repository/notification_firestore_repository.dart';

final uploadNotificationProvider = Provider.autoDispose<UploadNotification>(
  (ref) => UploadNotification(
    cacheRepository: ref.read(notificationCacheRepositoryProvider),
    // cloudRepository: ref.read(notificationFirestoreRepositoryProvider),
  ),
);
