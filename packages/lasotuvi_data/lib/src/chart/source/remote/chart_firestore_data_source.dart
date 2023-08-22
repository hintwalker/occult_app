import 'chart_cloud_data_source.dart';
import 'package:tauari_firebase/tauari_firebase.dart';
import '../../model/chart_model.dart';

class ChartFirestoreDataSource extends ChartCloudDataSource {
  ChartFirestoreDataSource(
    super.firestoreService, {
    required super.remoteFileService,
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: ChartModel.fromMap),
          listMapper: (snapshot) =>
              snapshotToModelList(snapshot, fromMap: ChartModel.fromMap),
        );
  // @override
  // String dataCollectionPath(String uid) => 'tuvi/$uid/c';

  // String avatarCollectionPath(String uid) => 'a/$uid';

  // Future<void> uploadAvatar(String uid, String localFilePath) async {
  //   final file = File(localFilePath);
  //   await remoteFileService.uploadFile(
  //       file, '${avatarCollectionPath(uid)}/${localFilePath.split('/').last}');
  // }

  // Future<void> deleteAvatar(String uid, String fileName) async {
  //   await remoteFileService
  //       .deleteFile('${avatarCollectionPath(uid)}/$fileName');
  // }

  // Future<void> downloadAvatar(String uid, String localFilePath) async {
  //   final fileName = localFilePath.split('/').last;
  //   await remoteFileService.downloadFile(
  //     uid: uid,
  //     localFilePath: localFilePath,
  //     remoteFilePath: '${avatarCollectionPath(uid)}/$fileName',
  //   );
  // }
}
