import 'dart:io';

import 'temp_file.dart';

Future<File> writeTempFile({
  required String? uid,
  required String name,
  required String content,
}) async {
  final file = await tempFile(uid: uid, name: name);
  // Write the file
  return file.writeAsString(content);
}
