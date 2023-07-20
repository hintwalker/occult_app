import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/local_notification_repository.dart';

final deleteNotificationFromLocalProvider =
    Provider.autoDispose<DeleteNotificationFromLocal>(
  (ref) => DeleteNotificationFromLocal(
      ref.read(localNotificationRepositoryProvider)),
);
