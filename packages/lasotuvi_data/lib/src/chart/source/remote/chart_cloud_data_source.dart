import 'dart:io';

import 'package:lasotuvi_data/src/chart/model/chart_model.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

abstract class ChartCloudDataSource extends CloudDataSource<ChartModel> {
  final RemoteFileService remoteFileService;
  ChartCloudDataSource(
    super.firestoreService, {
    required this.remoteFileService,
    required super.availableNetwork,
    required super.itemMapper,
    required super.listMapper,
  });
  // : super(
  //         itemMapper: (snapshot) =>
  //             snapshotToModel(snapshot, fromMap: ChartModel.fromMap),
  //         listMapper: (snapshot) =>
  //             snapshotToModelList(snapshot, fromMap: ChartModel.fromMap),
  //       );
  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/c';

  String avatarCollectionPath(String uid) => 'a/$uid';

  Future<void> uploadAvatar(String uid, String localFilePath) async {
    final file = File(localFilePath);
    await remoteFileService.uploadFile(
        file, '${avatarCollectionPath(uid)}/${localFilePath.split('/').last}');
  }

  Future<void> deleteAvatar(String uid, String fileName) async {
    await remoteFileService
        .deleteFile('${avatarCollectionPath(uid)}/$fileName');
  }

  Future<void> downloadAvatar(String uid, String localFilePath) async {
    final fileName = localFilePath.split('/').last;
    await remoteFileService.downloadFile(
      uid: uid,
      localFilePath: localFilePath,
      remoteFilePath: '${avatarCollectionPath(uid)}/$fileName',
    );
  }
}
