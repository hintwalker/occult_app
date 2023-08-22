import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/notification_local_repository.dart';

final insertNotificationToLocalProvider =
    Provider.autoDispose<InsertNotificationToLocal>(
  (ref) =>
      InsertNotificationToLocal(ref.read(notificationLocalRepositoryProvider)),
);
