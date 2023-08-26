import 'local_file.dart';

Future<String> readLocalFile({
  required String? uid,
  required String name,
}) async {
  final file = await localFile(uid: uid, name: name);
  final contents = await file.readAsString();
  return contents;
}
