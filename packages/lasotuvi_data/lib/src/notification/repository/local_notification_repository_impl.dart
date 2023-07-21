import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/notification_model.dart';

class LocalNotificationRepositoryImpl
    extends LocalRepositoryImpl<TuviNotification, NotificationModel>
    implements LocalNotificationRepository {
  LocalNotificationRepositoryImpl(super.dataSource)
      : super(entityToModel: (entity) => NotificationModel.fromEntity(entity));
}
