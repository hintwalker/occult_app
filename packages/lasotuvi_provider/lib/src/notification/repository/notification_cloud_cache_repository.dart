import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/src/notification/data_source/notification_firestore_data_source.dart';

import '../data_source/notification_cache_data_source.dart';

final notificationCloudCacheRepositoryProvider =
    Provider.autoDispose<CloudNotificationRepository>(
  (ref) => CloudNotificationRepositoryImpl(
    ref.read(notificationCacheDataSourceProvider),
    onlineDataSource: ref.read(notificationFirestoreDataSourceProvider),
  ),
);
