import 'local_file.dart';

Future<String> readLocalFile(String name) async {
  final file = await localFile(name);
  final contents = await file.readAsString();
  return contents;
}
