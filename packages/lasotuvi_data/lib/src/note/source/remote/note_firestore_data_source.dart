import 'note_cloud_data_source.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../../model/note_model.dart';

class NoteFirestoreDataSource extends NoteCloudDataSource {
  NoteFirestoreDataSource(
    super.firestoreService, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: NoteModel.fromMap),
          listMapper: (snapshot) =>
              snapshotToModelList(snapshot, fromMap: NoteModel.fromMap),
        );
}
