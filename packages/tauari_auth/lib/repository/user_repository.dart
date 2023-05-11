part of tauari_auth;

abstract class UserRepository implements CloudRepository<UserEntity> {
  // Future<String> setUser(UserEntity user);
  Future<String> setupInitUser(UserEntity user);
  // Future<String> setupInitUserData(UserEntity user);
}
