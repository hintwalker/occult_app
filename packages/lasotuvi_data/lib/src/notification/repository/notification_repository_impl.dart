import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/notification_model.dart';

class NotificationRepositoryImpl
    extends SyncableRepositoryImpl<TuviNotification, NotificationModel>
    implements NotificationRepository {
  NotificationRepositoryImpl({
    required super.localRepository,
    required super.cloudRepository,
  });
}
