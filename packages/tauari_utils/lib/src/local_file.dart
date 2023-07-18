import 'dart:io';
import 'local_path.dart';

Future<File> localFile(String name) async {
  final path = await localPath();
  return File('$path/$name');
}
