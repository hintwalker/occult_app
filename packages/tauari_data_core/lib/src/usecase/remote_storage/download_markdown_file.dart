import 'package:flutter/foundation.dart';
import 'package:tauari_utils/tauari_utils.dart';

import '../../repository/remote_file_repository.dart';

class DownloadMarkdownFile {
  const DownloadMarkdownFile(this.repository);
  final RemoteFileRepository repository;
  Future<String> call({
    required String uid,
    required String remoteFileName,
    int maxSize = 1048576,
  }) async {
    final existFile = await tempFile(uid: uid, name: remoteFileName);
    if (await existFile.exists()) {
      return await existFile.readAsString();
    } else {
      final data = await repository.download(
        uid: uid,
        remoteFileName: remoteFileName,
        maxSize: maxSize,
      );
      final stringData = convertUint8ListToString(data);
      try {
        await existFile.create(recursive: true);
        await existFile.writeAsString(stringData);
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }

      return stringData;
    }
  }
}
