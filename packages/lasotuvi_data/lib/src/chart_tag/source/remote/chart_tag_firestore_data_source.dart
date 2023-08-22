import 'chart_tag_cloud_data_source.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../../model/chart_tag_model.dart';

class ChartTagFirestoreDataSource extends ChartTagCloudDataSource {
  ChartTagFirestoreDataSource(
    super.service, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) => snapshotToModel(
            snapshot,
            fromMap: (map) => ChartTagModel.fromMap(map).copyWith(
              modified: DateTime.now().millisecondsSinceEpoch,
            ),
          ),
          listMapper: (snapshot) => snapshotToModelList(
            snapshot,
            fromMap: (map) => ChartTagModel.fromMap(map).copyWith(
              modified: DateTime.now().millisecondsSinceEpoch,
            ),
          ),
        );
}
