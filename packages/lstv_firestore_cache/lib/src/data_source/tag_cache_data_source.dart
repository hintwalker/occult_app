import 'package:lasotuvi_data/lasotuvi_data.dart';
import '../mapper/cache_to_model.dart';
import '../mapper/cache_to_model_list.dart';

class TagCacheDataSource extends TagCloudDataSource {
  TagCacheDataSource(
    super.firestoreService, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) =>
              cacheToModel(snapshot, fromMap: TagModel.fromMap),
          listMapper: (snapshot) =>
              cacheToModelList(snapshot, fromMap: TagModel.fromMap),
        );
}
