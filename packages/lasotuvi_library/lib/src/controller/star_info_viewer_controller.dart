// import 'dart:io';

import 'package:flutter/material.dart';

import '../usecase/download_star_info.dart';

class StarInfoViewerController extends ChangeNotifier {
  StarInfoViewerController(this.downloadStarInfo);
  final DownloadStarInfo downloadStarInfo;

  // Future<File> loadLocalFile(String uid, String starName) async {
  //   return await downloadStarInfo.call(
  //     uid: uid,
  //     fileName: '$starName.md',
  //     url: item.url,
  //     onReceiveProgress: (count, total) {},
  //     onSuccess: (tempFile) {},
  //   );
  //   // return await downloadBookToLocal.call(
  //   //     remoteFileName: 'tuvi_dauso_toanthu.pdf',
  //   //     localFileName: '$remoteFileName.pdf',
  //   //     localFolderName: 'books');
  // }

  Future<String> download({
    required String uid,
    required String starName,
  }) =>
      downloadStarInfo(uid: uid, remoteFileName: '$starName.md');
}
