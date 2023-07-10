import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/user_entity.dart';

abstract class UserRepository implements CloudRepository<UserEntity> {
  // Future<String> setUser(UserEntity user);
  Future<String> setupInitUser(UserEntity user);
  // Future<String> setupInitUserData(UserEntity user);
}
