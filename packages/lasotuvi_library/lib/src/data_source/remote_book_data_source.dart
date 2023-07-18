import 'package:tauari_data_core/tauari_data_core.dart';

class RemoteBookDataSource extends RemoteFileDataSource {
  RemoteBookDataSource(super.service);

  @override
  String get folderPath => 'books';
}
