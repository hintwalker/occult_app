import 'dart:io';

import 'package:tauari_data_core/tauari_data_core.dart';

class DownloadFileToLocal {
  DownloadFileToLocal({
    required this.repository,
    // required this.localFileName,
    // required this.localFolderName,
    this.canceled,
    this.error,
    this.running,
    this.success,
  });
  final RemoteFileRepository repository;
  // final String localFolderName;
  // final String localFileName;
  void Function(int bytesTransferred, int totalBytes)? running;
  void Function()? success;
  void Function()? error;
  void Function()? canceled;
  Future<File> call({
    required String remoteFileName,
    required String localFolderName,
    required String localFileName,
  }) =>
      repository.downloadToLocal(
        remoteFileName: remoteFileName,
        localFolderName: localFolderName,
        localFileName: localFileName,
        running: running,
        success: success,
        error: error,
        canceled: canceled,
      );
}
