import 'dart:io';
import 'dart:typed_data';

import '../../source/remote_file_data_source.dart';
import '../remote_file_repository.dart';

class RemoteFileRepositoryImpl implements RemoteFileRepository {
  const RemoteFileRepositoryImpl(this.dataSource);
  final RemoteFileDataSource dataSource;
  @override
  Future<Uint8List?> download({
    required String uid,
    required String remoteFileName,
    required int maxSize,
  }) =>
      dataSource.download(
        uid: uid,
        remoteFileName: remoteFileName,
        maxSize: maxSize,
      );

  @override
  Future<File> downloadToLocal({
    required String remoteFileName,
    required String localFolderName,
    required String localFileName,
    void Function(int bytesTransferred, int totalBytes)? running,
    void Function()? success,
    void Function()? error,
    void Function()? canceled,
  }) =>
      dataSource.downloadToLocal(
        remoteFileName: remoteFileName,
        localFolderName: localFolderName,
        localFileName: localFileName,
        running: running,
        success: success,
        error: error,
        canceled: canceled,
      );

  @override
  Future<File> downloadAsTemp({
    required String uid,
    required String fileName,
    required String url,
    required Function(int count, int total) onReceiveProgress,
    required Function(File tempFile) onSuccess,
  }) =>
      dataSource.downloadAsTemp(
        uid: uid,
        fileName: fileName,
        url: url,
        onReceiveProgress: onReceiveProgress,
        onSuccess: onSuccess,
      );
}
