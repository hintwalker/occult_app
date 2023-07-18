import 'package:flutter/material.dart';

import '../usecase/download_star_info.dart';

class StarInfoViewerController extends ChangeNotifier {
  StarInfoViewerController(this.downloadStarInfo);
  final DownloadStarInfo downloadStarInfo;

  Future<String> download({
    required String uid,
    required String starName,
  }) =>
      downloadStarInfo(uid: uid, remoteFileName: '$starName.md');
}
