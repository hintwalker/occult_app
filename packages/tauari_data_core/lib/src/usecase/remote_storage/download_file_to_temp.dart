import 'dart:io';

import '../../repository/remote_file_repository.dart';

class DownloadFileToTemp {
  const DownloadFileToTemp(this.repository);
  final RemoteFileRepository repository;

  Future<File> call({
    required String uid,
    required String fileName,
    required String url,
    required Function(int count, int total) onReceiveProgress,
    required Function(File tempFile) onSuccess,
  }) =>
      repository.downloadAsTemp(
        uid: uid,
        fileName: fileName,
        url: url,
        onReceiveProgress: onReceiveProgress,
        onSuccess: onSuccess,
      );
}
