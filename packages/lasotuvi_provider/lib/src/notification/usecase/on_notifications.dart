import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/notification_repository.dart';

final onNotificationsProvider = Provider.autoDispose<OnNotifications>(
    (ref) => OnNotifications(ref.read(notificationRepositoryProvider)));
