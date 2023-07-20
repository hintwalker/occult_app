import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/local_notification_repository.dart';

final insertNotificationToLocalProvider =
    Provider.autoDispose<InsertNotificationToLocal>(
  (ref) =>
      InsertNotificationToLocal(ref.read(localNotificationRepositoryProvider)),
);
