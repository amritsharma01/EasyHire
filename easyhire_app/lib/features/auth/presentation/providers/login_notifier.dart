import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/get.dart';
import '../../../../core/services/storage_services/token_storage_service.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginState {
  final bool isLoading;
  final String? error;

  LoginState({this.isLoading = false, this.error});
}

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginUseCase loginUseCase;
  final TokenStorage tokenStorage;

  LoginNotifier(this.loginUseCase, this.tokenStorage) : super(LoginState());

  Future<void> login(String username, String password) async {
    try {
      final token = await loginUseCase.execute(username, password);
      final accessToken = token.access;
      final refreshToken = token.refresh;
      await tokenStorage.saveTokens(accessToken!, refreshToken!);
    } catch (e) {
      Get.snackbar("Username or Password Incorrect");
    }
  }

  Future<void> logout() async {
    try {
      // Remove token or session data from secure storage

      await tokenStorage.clearTokens();
    } catch (e) {
      rethrow; // Handle errors if needed
    }
  }
}
