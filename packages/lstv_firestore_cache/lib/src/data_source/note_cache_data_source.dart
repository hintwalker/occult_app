import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../mapper/cache_to_model.dart';
import '../mapper/cache_to_model_list.dart';

class NoteCacheDataSource extends NoteCloudDataSource {
  NoteCacheDataSource(
    super.service, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) =>
              cacheToModel(snapshot, fromMap: NoteModel.fromMap),
          listMapper: (snapshot) =>
              cacheToModelList(snapshot, fromMap: NoteModel.fromMap),
        );
}
