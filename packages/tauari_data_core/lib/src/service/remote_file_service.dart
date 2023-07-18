import 'dart:io';
import 'dart:typed_data';

abstract class RemoteFileService {
  const RemoteFileService();
  Future<Uint8List?> download(String path, int maxSize);
  Future<File> downloadToLocal({
    required String remoteFileName,
    required String localFolderName,
    required String localFileName,
    void Function(int bytesTransferred, int totalBytes)? running,
    void Function()? success,
    void Function()? error,
    void Function()? canceled,
  });

  Future<File> downloadAsTemp(
      {required String uid,
      required String fileName,
      required String url,
      required Function(int count, int total) onReceiveProgress,
      required Function(File tempFile) onSuccess});
}
