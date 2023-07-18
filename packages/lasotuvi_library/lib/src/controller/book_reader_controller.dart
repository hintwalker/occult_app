import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../box/library_box_name.dart';

import '../entity/book_item.dart';
import '../usecase/download_book_to_local.dart';

class BookReaderController extends ChangeNotifier {
  BookReaderController({required this.downloadBookToLocal});
  final DownloadBookToLocal downloadBookToLocal;
  bool downloadSuccess = false;

  Future<File> loadLocalFile(String uid, BookItem item) async {
    return await downloadBookToLocal.call(
      uid: uid,
      fileName: '${item.name}.pdf',
      url: item.url,
      onReceiveProgress: (count, total) {},
      onSuccess: (tempFile) {},
    );
    // return await downloadBookToLocal.call(
    //     remoteFileName: 'tuvi_dauso_toanthu.pdf',
    //     localFileName: '$remoteFileName.pdf',
    //     localFolderName: 'books');
  }

  Future<void> saveCurrentPage({
    required String uid,
    required String bookName,
    required int currentPage,
  }) async {
    final box = await Hive.openBox<int>(currentPageBoxName);
    box.put(
      boxKey(uid, bookName),
      currentPage,
    );
  }

  Future<int> getCurrentPage({
    required String uid,
    required String bookName,
  }) async {
    final box = await Hive.openBox<int>(currentPageBoxName);
    return box.get(boxKey(uid, bookName), defaultValue: 0) ?? 0;
  }

  String boxKey(String uid, String bookName) => '${uid}_$bookName';
}
