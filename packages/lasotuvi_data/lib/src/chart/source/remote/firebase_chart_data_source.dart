import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../../model/chart_model.dart';

class FirebaseChartDataSource extends RemoteDataSource<ChartModel> {
  FirebaseChartDataSource(super.firestoreService)
      : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: ChartModel.fromMap),
          listMapper: (snapshot) =>
              snapshotToModelList(snapshot, fromMap: ChartModel.fromMap),
        );
  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/charts';
}
