import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../model/user_model.dart';

class UserDataSource extends RemoteDataSource<UserModel> {
  UserDataSource(
    super.service,
  ) : super(
          itemMapper: (snapshot) => snapshotToModel(snapshot,
              fromMap: UserModel.fromMap, idIsString: true),
          listMapper: (snapshot) => snapshotToModelList(snapshot,
              fromMap: UserModel.fromMap, idIsString: true),
        );

  // Future<String> setUser(UserEntity user) async {
  //   await service.setDataOnDocument(
  //       data: user.toFirestore(),
  //       collectionPath: dataCollectionPath(user.docId),
  //       doc: user.uidInFirestore);
  //   return user.uidInFirestore;
  // }

  // Future<bool> exists(UserModel user) async {
  //   final userRef = await service.getFromDocument(
  //       collectionPath: dataCollectionPath(user.docId), docId: user.docId);
  //   return userRef.exists;
  // }

  // Stream<List<UserModel?>> onUsers() => service
  //     .getSnapshotStreamFromCollection(collectionPath: _usersCollectionPath())
  //     .map((e) => listMapper);

  // Future<UserEntity?> userById(String uid) async {
  //   try {
  //     final user = await service.getFromDocument(
  //         collectionPath: _usersCollectionPath(), docId: uid);
  //     if (user.data() == null) {
  //       return Future.value(null);
  //     }
  //     return UserEntity.fromMap(user.data()!);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e.toString());
  //     }
  //   }
  //   return Future.value(null);
  // }

  Future<String> setupInitUser(UserModel user) async {
    await insert(user.docId, user);
    await setupInitUserData(user);
    return user.docId;
  }

  Future<String> setupInitUserData(UserModel user) async {
    // await service.setDataOnDocument(
    //     data: {'a': DateTime.now().toLocal()},
    //     collectionPath: _tuviCollectionPath(),
    //     documentPath: user.uidInFirestore);

    // await service.createEmptyCollection(
    //     collectionPath: _chartsCollectionPath(user.uidInFirestore));
    // await service.deleteDocumentFromCollection(
    //     collectionPath: _chartsCollectionPath(user.uidInFirestore),
    //     documentPath: chart.id!.toString());
    return user.docId;
  }

  @override
  String dataCollectionPath(String uid) => 'users';
}
