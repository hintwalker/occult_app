import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/notification_repository.dart';

final onNotificationProvider = Provider.autoDispose<OnNotification>(
    (ref) => OnNotification(ref.read(notificationRepositoryProvider)));
