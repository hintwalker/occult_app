import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/notification.dart';

abstract class NotificationRepository extends SyncableRepository<Notification> {
  NotificationRepository(
      {required super.localRepository, required super.cloudRepository});
}
