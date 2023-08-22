import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

abstract class ChartTagCloudDataSource extends CloudDataSource<ChartTagModel> {
  ChartTagCloudDataSource(super.service,
      {required super.itemMapper,
      required super.listMapper,
      required super.availableNetwork});
  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/ct';
}
