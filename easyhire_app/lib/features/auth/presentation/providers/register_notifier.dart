import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/register_usecase.dart';

class RegisterState {
  final bool isLoading;
  final String? successMessage;
  final String? error;

  RegisterState({
    this.isLoading = false,
    this.successMessage,
    this.error,
  });
}

class RegisterNotifier extends StateNotifier<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterNotifier(this.registerUseCase) : super(RegisterState());

  Future<void> register({
    required String username,
    required String email,
    required String password,
    required bool isJobSeeker,
    required bool isEmployer,
  }) async {
    state = RegisterState(isLoading: true);

    try {
      final message = await registerUseCase.execute(
        username: username,
        email: email,
        password: password,
        isJobSeeker: isJobSeeker,
        isEmployer: isEmployer,
      );
      state = RegisterState(successMessage: message.toString());
    } catch (e) {
      state = RegisterState(error: e.toString());
      rethrow;
    }
  }
}
