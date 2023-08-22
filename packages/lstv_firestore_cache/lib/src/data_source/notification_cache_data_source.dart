import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../mapper/cache_to_model.dart';
import '../mapper/cache_to_model_list.dart';

class NotificationCacheDataSource extends NotificationCloudDataSource {
  NotificationCacheDataSource(super.service, {required super.availableNetwork})
      : super(
          itemMapper: (snapshot) =>
              cacheToModel(snapshot, fromMap: NotificationModel.fromMap),
          listMapper: (snapshot) =>
              cacheToModelList(snapshot, fromMap: NotificationModel.fromMap),
        );
}
