import '../entity/user_entity.dart';

import '../repository/user_repo.dart';

class GetUserProfileUseCase {
  final UserRepo repository;

  GetUserProfileUseCase(this.repository);

  Future<UserEntity> call() async {
    final response = await repository.fetchUserProfile();
    return response;
  }
}

class GetLocalUserUseCase {
  final UserRepo repository;

  GetLocalUserUseCase(this.repository);

  UserEntity? call() {
    return repository.getLocalUser();
  }
}
