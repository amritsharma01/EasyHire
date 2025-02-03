import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/get.dart';
import '../../../../core/services/storage_services/token_storage_service.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginNotifier extends StateNotifier<AsyncValue> {
  final LoginUseCase loginUseCase;
  final TokenStorage tokenStorage;

  LoginNotifier(this.loginUseCase, this.tokenStorage)
      : super(AsyncValue.data(null));

  Future<void> login(String username, String password) async {
    state = const AsyncValue.loading();
    try {
      final token = await loginUseCase.execute(username, password);
      final accessToken = token.access;
      final refreshToken = token.refresh;
      await tokenStorage.saveTokens(accessToken!, refreshToken!);
      state = const AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace); // Error state
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
