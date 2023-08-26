import 'package:tauari_local_file/tauari_local_file.dart';

class LoadStarInfoFromLocal {
  Future<String> call(String? uid, String starName) async {
    return readTempFileAsString(uid: uid, name: '$starName.md');
  }
}
