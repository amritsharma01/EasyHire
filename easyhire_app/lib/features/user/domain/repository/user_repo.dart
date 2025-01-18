import '../entity/user_entity.dart';

abstract class UserRepo {
  Future<UserEntity> fetchUserProfile();
  UserEntity? getLocalUser();
}
