import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/notification.dart';
import '../repository/notification_repository.dart';

class UpdateNotification extends Update<Notification, NotificationRepository> {
  UpdateNotification(super.repository);
}
