import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:path_provider/path_provider.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class FirebaseStorageService extends RemoteFileService {
  const FirebaseStorageService(this.firebaseStorage);
  final FirebaseStorage firebaseStorage;
  @override
  Future<Uint8List?> download(String path, int maxSize) async {
    final storageRef = firebaseStorage.ref();
    final islandRef = storageRef.child(path);

    try {
      // const oneMegabyte = 1024 * 1024;
      final Uint8List? data = await islandRef.getData(maxSize);
      return data;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      return null;
    }
  }

  @override
  Future<File> downloadToLocal({
    required String remoteFileName,
    required String localFolderName,
    required String localFileName,
    void Function(int bytesTransferred, int totalBytes)? running,
    void Function()? success,
    void Function()? error,
    void Function()? canceled,
  }) async {
    final fileRef = firebaseStorage.ref().child(remoteFileName);
    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath =
        "${appDocDir.absolute.path}/$localFolderName/$localFileName";
    final file = File(filePath);
    await fileRef.writeToFile(file);
    // downloadTask.snapshotEvents.listen((taskSnapshot) {
    //   switch (taskSnapshot.state) {
    //     case TaskState.running:
    //       if (running != null) {
    //         running(
    //           taskSnapshot.bytesTransferred,
    //           taskSnapshot.totalBytes,
    //         );
    //       }
    //       break;
    //     case TaskState.success:
    //       if (success != null) {
    //         success();
    //       }
    //       break;
    //     case TaskState.canceled:
    //       if (canceled != null) {
    //         canceled();
    //       }
    //       break;
    //     case TaskState.error:
    //       if (error != null) {
    //         error();
    //       }
    //       break;
    //     default:
    //       break;
    //   }
    // });
    return file;
  }

  @override
  Future<File> downloadAsTemp({
    required String uid,
    required String fileName,
    required String url,
    required Function(int count, int total) onReceiveProgress,
    required Function(File tempFile) onSuccess,
  }) async {
    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/$uid/$fileName';
    final dio = Dio();
    final tempFile = File(tempPath);
    if (await tempFile.exists()) {
      if (await tempFile.length() == 0) {
        await dio.download(
          url,
          tempPath,
          onReceiveProgress: onReceiveProgress,
        );
      } else {
        onSuccess(tempFile);
      }
    } else {
      await dio.download(
        url,
        tempPath,
        onReceiveProgress: onReceiveProgress,
      );
    }
    return tempFile;
  }
}
