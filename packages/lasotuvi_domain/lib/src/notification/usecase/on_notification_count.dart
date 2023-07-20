import 'package:tauari_data_core/tauari_data_core.dart';

import '../repository/notification_repository.dart';

class OnNotificationCount extends OnCountEveryWhere<NotificationRepository> {
  const OnNotificationCount(super.repository);
}
