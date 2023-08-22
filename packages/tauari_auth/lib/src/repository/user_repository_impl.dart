import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/user_entity.dart';
import '../model/user_model.dart';
import '../source/user_data_source.dart';
import 'user_repository.dart';

class UserRepositoryImpl extends CloudRepositoryImpl<UserEntity, UserModel>
    implements UserRepository {
  UserRepositoryImpl(
    super.cacheDataSource, {
    required super.onlineDataSource,
  }) : super(entityToModel: (e) => UserModel.fromEntity(e));
  // @override
  // Future<String> setUser(UserEntity user) => dataSource.setUser(user);

  @override
  Future<String> setupInitUser(UserEntity user) =>
      (cacheDataSource as UserDataSource).setupInitUser(entityToModel(user));

  // @override
  // Future<String> setupInitUserData(UserEntity user) =>
  //     dataSource.setupInitUserData(user);
}
