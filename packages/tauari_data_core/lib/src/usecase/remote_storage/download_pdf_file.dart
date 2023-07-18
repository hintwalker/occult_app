import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../../repository/remote_file_repository.dart';

class DownloadPdfFile {
  const DownloadPdfFile(this.repository);
  final RemoteFileRepository repository;
  Future<File?> call({
    required String uid,
    required String remoteFileName,
    int maxSize = 5 * 1024 * 1024,
  }) async {
    final data = await repository.download(
      uid: uid,
      remoteFileName: remoteFileName,
      maxSize: maxSize,
    );
    if (data != null) {
      final String dir = (await getApplicationDocumentsDirectory()).path;
      final String path = '$dir/$remoteFileName';
      final File file = File(path);
      await file.writeAsBytes(data);
      return file;
    }

    return null;
  }
}
