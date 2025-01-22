import 'package:easyhire_app/features/auth/domain/entities/token_entity.dart';

import '../../domain/repositories/login_repo.dart';
import '../datasource/auth_remote_datasource.dart';
import '../models/token_model.dart';

class LoginRepoImpl implements LoginRepo {
  final AuthRemoteDataSource _authremoteDataSource;

  LoginRepoImpl(this._authremoteDataSource);

  @override
  Future<TokenEntity> getTokens(
      {required String username, required String password}) async {
    try {
      final response =
          await _authremoteDataSource.getTokens(username, password);
      final token = TokenModel.fromJson(response.data);

      return token;
    } catch (e) {
      rethrow;
    }
  }
}
