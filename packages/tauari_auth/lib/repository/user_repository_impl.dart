part of tauari_auth;

class UserRepositoryImpl extends CloudRepositoryImpl<UserEntity, UserModel>
    implements UserRepository {
  UserRepositoryImpl(UserDataSource ds)
      : super(ds, entityToModel: (e) => UserModel.fromEntity(e));
  // @override
  // Future<String> setUser(UserEntity user) => dataSource.setUser(user);

  @override
  Future<String> setupInitUser(UserEntity user) =>
      (dataSource as UserDataSource).setupInitUser(entityToModel(user));

  // @override
  // Future<String> setupInitUserData(UserEntity user) =>
  //     dataSource.setupInitUserData(user);

  //       @override
  //       Future<bool> insert(String uid, UserEntity item) {
  //         // TODO: implement insert
  //         throw UnimplementedError();
  //       }
}
