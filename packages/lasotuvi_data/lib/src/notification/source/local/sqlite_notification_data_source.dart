import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/notification_model.dart';

class SqliteNotificationDataSource extends LocalDataSource<NotificationModel> {
  SqliteNotificationDataSource(super.dao)
      : super(fromMap: (map) => NotificationModel.fromMap(map));
}
