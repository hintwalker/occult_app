import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/note_model.dart';

abstract class NoteCloudDataSource extends CloudDataSource<NoteModel> {
  NoteCloudDataSource(super.service,
      {required super.itemMapper,
      required super.listMapper,
      required super.availableNetwork});

  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/n';

  String ownerCollectionPath(String uid) => 'tuvi/$uid/c';
}
