import 'dart:io';
import 'dart:typed_data';
import '../service/remote_file_service.dart';

abstract class RemoteFileDataSource {
  const RemoteFileDataSource(this.service);
  final RemoteFileService service;
  String get folderPath;
  Future<Uint8List?> download({
    required String uid,
    required String remoteFileName,
    int maxSize = 1048576,
  }) =>
      service.download('$folderPath/$remoteFileName', maxSize);

  Future<File> downloadToLocal({
    required String remoteFileName,
    required String localFolderName,
    required String localFileName,
    void Function(int bytesTransferred, int totalBytes)? running,
    void Function()? success,
    void Function()? error,
    void Function()? canceled,
  }) =>
      service.downloadToLocal(
        remoteFileName: '$folderPath/$remoteFileName',
        localFileName: localFileName,
        localFolderName: localFolderName,
        running: running,
        success: success,
        error: error,
        canceled: canceled,
      );

  Future<File> downloadAsTemp(
          {required String uid,
          required String fileName,
          required String url,
          required Function(int count, int total) onReceiveProgress,
          required Function(File tempFile) onSuccess}) =>
      service.downloadAsTemp(
        uid: uid,
        fileName: fileName,
        url: url,
        onReceiveProgress: onReceiveProgress,
        onSuccess: onSuccess,
      );
}
