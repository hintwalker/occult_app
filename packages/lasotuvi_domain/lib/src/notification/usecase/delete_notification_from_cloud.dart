import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/notification.dart';
import '../repository/cloud_notification_repository.dart';

class DeleteNotificationFromCloud
    extends DeleteFromCloud<TuviNotification, CloudNotificationRepository> {
  DeleteNotificationFromCloud(super.repository);
}
