import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/notification.dart';
import '../repository/local_notification_repository.dart';

class DeleteNotificationFromLocal
    extends DeleteFromLocal<Notification, LocalNotificationRepository> {
  DeleteNotificationFromLocal(super.repository);
}
