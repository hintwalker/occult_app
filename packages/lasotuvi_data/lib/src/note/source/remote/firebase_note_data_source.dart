import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../../model/note_model.dart';

class FirebaseNoteDataSource extends RemoteDataSource<NoteModel> {
  FirebaseNoteDataSource(super.firestoreService)
      : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: NoteModel.fromMap),
          listMapper: (snapshot) =>
              snapshotToModelList(snapshot, fromMap: NoteModel.fromMap),
        );
  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/n';

  String ownerCollectionPath(String uid) => 'tuvi/$uid/c';
}
