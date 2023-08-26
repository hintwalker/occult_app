import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_local_file/tauari_local_file.dart';

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
    // final tempDir = await getTemporaryDirectory();
    // final tempPath = '${tempDir.path}/$uid/$fileName';
    final dio = Dio();
    final file = await tempFile(uid: uid, name: fileName); // File(tempPath);
    if (await file.exists()) {
      if (await file.length() == 0) {
        await dio.download(
          url,
          file.path,
          onReceiveProgress: onReceiveProgress,
        );
      } else {
        onSuccess(file);
      }
    } else {
      await dio.download(
        url,
        file.path,
        onReceiveProgress: onReceiveProgress,
      );
    }
    return file;
  }

  @override
  Future<void> uploadFile(File file, String destination) async {
    if (!await file.exists()) {
      return;
    }
    final fileRef = firebaseStorage.ref().child(destination);
    final compressed = await FlutterImageCompress.compressWithFile(file.path,
        minHeight: 216, minWidth: 216, quality: 10);
    if (compressed != null) {
      fileRef.putData(compressed);
    }
  }

  @override
  Future<void> deleteFile(String filePath) async {
    final fileRef = firebaseStorage.ref().child(filePath);
    try {
      await fileRef.delete();
    } catch (_) {}
  }

  @override
  Future<void> downloadFile({
    required String uid,
    required String localFilePath,
    required String remoteFilePath,
  }) async {
    final file = File(localFilePath);
    if (await file.exists()) {
      return;
    }

    final fileRef = firebaseStorage.ref().child(remoteFilePath);
    fileRef.writeToFile(file);
  }
}
