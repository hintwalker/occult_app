import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/cloud_notification_repository.dart';

final deleteNotificationFromCloudProvider =
    Provider.autoDispose<DeleteNotificationFromCloud>(
  (ref) => DeleteNotificationFromCloud(
      ref.read(cloudNotificationRepositoryProvider)),
);
