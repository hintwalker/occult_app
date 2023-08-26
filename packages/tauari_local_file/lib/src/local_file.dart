import 'dart:io';
import 'local_path.dart';

Future<File> localFile({
  required String? uid,
  required String name,
}) async {
  final path = await localPath();
  return File(uid == null ? '$path/$name' : '$path/$uid/$name');
}
