import 'dart:io';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_utils/tauari_utils.dart';

import '../../model/chart_model.dart';

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

  Future<void> uploadAvatar(String uid, AvatarFile avatar) async {
    final file = File(await avatar.localPath());
    await remoteFileService.uploadFile(
        file, '${avatarCollectionPath(uid)}/${avatar.name}');
    // await remoteFileService.uploadFile(
    //     file, '${avatarCollectionPath(uid)}/${localFilePath.split('/').last}');
  }

  Future<void> deleteAvatar(String uid, String fileName) async {
    await remoteFileService
        .deleteFile('${avatarCollectionPath(uid)}/$fileName');
  }

  Future<void> downloadAvatar(String uid, AvatarFile avatar) async {
    // final fileName = localFilePath.split('/').last;
    final path = await avatar.localPath();
    await remoteFileService.downloadFile(
      uid: uid,
      localFilePath: path,
      remoteFilePath: '${avatarCollectionPath(uid)}/${avatar.name}',
    );
  }
}
