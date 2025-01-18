import 'package:easyhire_app/features/auth/domain/entities/token_entity.dart';

//this is also login_repo
abstract class LoginRepo {
  Future<TokenEntity> getTokens(
      {required String username, required String password});
}
