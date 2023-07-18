import 'dart:io';

import 'local_file.dart';

Future<File> writeLocalFile(String name, String content) async {
  final file = await localFile(name);
  // Write the file
  return file.writeAsString(content);
}
