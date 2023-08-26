import 'dart:io';
import 'temp_path.dart';

Future<File> tempFile({
  required String? uid,
  required String name,
}) async {
  final path = await tempPath();
  return File(uid == null ? '$path/$name' : '$path/$uid/$name');
}
