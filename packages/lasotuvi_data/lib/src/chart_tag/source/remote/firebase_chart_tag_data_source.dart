import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../../model/chart_tag_model.dart';

class FirebaseChartTagDataSource extends RemoteDataSource<ChartTagModel> {
  FirebaseChartTagDataSource(super.service)
      : super(
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

  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/ct';
}
