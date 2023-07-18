import 'temp_file.dart';

Future<String> readTempFileAsString({
  required String? uid,
  required String name,
}) async {
  final file = await tempFile(uid: uid, name: name);
  final contents = await file.readAsString();
  return contents;
}
