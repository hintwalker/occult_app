import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../data_source/notification_sqlite_data_source.dart';

final notificationLocalRepositoryProvider =
    Provider.autoDispose<LocalNotificationRepository>(
  (ref) => LocalNotificationRepositoryImpl(
      ref.read(sqliteNotificationDataSourceProvider)),
);
