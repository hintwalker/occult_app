import 'package:tauari_utils/tauari_utils.dart';

class LoadStarInfoFromLocal {
  Future<String> call(String? uid, String starName) async {
    return readTempFileAsString(uid: uid, name: '$starName.md');
  }
}
