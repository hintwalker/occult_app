import 'dart:io';

import 'local_file.dart';

Future<File> writeLocalFile({
  required String? uid,
  required String name,
  required String content,
}) async {
  final file = await localFile(uid: uid, name: name);
  // Write the file
  return file.writeAsString(content);
}
