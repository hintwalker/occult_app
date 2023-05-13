part of lasotuvi_data;

class FirebaseNoteDataSource extends RemoteDataSource<NoteModel> {
  FirebaseNoteDataSource(super.firestoreService)
      : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: NoteModel.fromMap),
          listMapper: (snapshot) =>
              snapshotToModelList(snapshot, fromMap: NoteModel.fromMap),
        );
  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/notes';

  String ownerCollectionPath(String uid) => 'tuvi/$uid/charts';
}
