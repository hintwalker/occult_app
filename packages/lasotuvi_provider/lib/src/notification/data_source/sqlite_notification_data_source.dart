import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../dao/notification_dao.dart';

final sqliteNotificationDataSourceProvider =
    Provider.autoDispose<SqliteNotificationDataSource>(
  (ref) => SqliteNotificationDataSource(ref.read(notificationDaoProvider)),
);
