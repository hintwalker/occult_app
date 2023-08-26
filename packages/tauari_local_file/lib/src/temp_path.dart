import 'package:path_provider/path_provider.dart';

Future<String> tempPath() async {
  final directory = await getTemporaryDirectory();
  return directory.path;
}
