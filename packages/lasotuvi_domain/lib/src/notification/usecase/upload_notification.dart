import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/notification.dart';
import '../repository/notification_repository.dart';

class UploadNotification
    extends Upload<TuviNotification, NotificationRepository> {
  UploadNotification({
    required super.cacheRepository,
    // required super.cloudRepository,
  });
}
