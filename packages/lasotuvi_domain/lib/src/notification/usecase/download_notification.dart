import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/notification.dart';
import '../repository/notification_repository.dart';

class DownloadNotification
    extends Download<Notification, NotificationRepository> {
  DownloadNotification(super.repository);
}
