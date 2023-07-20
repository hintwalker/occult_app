import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/notification_model.dart';

class CloudNotificationRepositoryImpl
    extends CloudRepositoryImpl<Notification, NotificationModel>
    implements CloudNotificationRepository {
  CloudNotificationRepositoryImpl(super.dataSource)
      : super(entityToModel: (entity) => NotificationModel.fromEntity(entity));
}
