import 'package:tauari_local_file/tauari_local_file.dart';

class AvatarFile {
  final String name;
  Future<String> localPath() async {
    final path = await tempPath();
    return '$path/$name';
  }

  const AvatarFile(this.name);
}
