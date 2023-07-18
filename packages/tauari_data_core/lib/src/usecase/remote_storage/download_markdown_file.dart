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
    final data = await repository.download(
      uid: uid,
      remoteFileName: remoteFileName,
      maxSize: maxSize,
    );
    return convertUint8ListToString(data);
  }
}
