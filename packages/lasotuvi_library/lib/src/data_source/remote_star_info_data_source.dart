import 'package:tauari_data_core/tauari_data_core.dart';

class RemoteStarInfoDataSource extends RemoteFileDataSource {
  RemoteStarInfoDataSource(super.service);
  @override
  String get folderPath => 'stars';
}
