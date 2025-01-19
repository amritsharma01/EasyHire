import '../entities/token_entity.dart';
import '../repositories/login_repo.dart';

class LoginUseCase {
  final LoginRepo repository;

  LoginUseCase(this.repository);

  Future<TokenEntity> execute(String username, String password) async {
    final response =
        await repository.getTokens(username: username, password: password);
    return response;
  }
}
