import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/notification_cache_repository.dart';

final downloadNotificationProvider = Provider.autoDispose<DownloadNotification>(
  (ref) => DownloadNotification(ref.read(notificationCacheRepositoryProvider)),
);
