import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../mapper/cache_to_model.dart';
import '../mapper/cache_to_model_list.dart';

class CommentaryCacheDataSource extends CommentaryCloudDataSource {
  CommentaryCacheDataSource(super.service, {required super.availableNetwork})
      : super(
          itemMapper: (snapshot) =>
              cacheToModel(snapshot, fromMap: CommentaryModel.fromMap),
          listMapper: (snapshot) =>
              cacheToModelList(snapshot, fromMap: CommentaryModel.fromMap),
        );
}
