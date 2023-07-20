import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/notification.dart';
import '../repository/notification_repository.dart';

class SyncNotifications extends SyncData<Notification, NotificationRepository> {
  SyncNotifications(super.repository);
}
