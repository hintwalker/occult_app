import 'package:tauari_utils/src/temp_path.dart';

class AvatarFile {
  final String name;
  Future<String> localPath() async {
    final path = await tempPath();
    return '$path/$name';
  }

  const AvatarFile(this.name);
}
