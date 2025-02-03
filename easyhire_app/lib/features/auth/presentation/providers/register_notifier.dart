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

class RegisterNotifier extends StateNotifier<AsyncValue> {
  final RegisterUseCase registerUseCase;

  RegisterNotifier(this.registerUseCase) : super(AsyncValue.data(null));

  Future<void> register({
    required String username,
    required String email,
    required String password,
    required bool isJobSeeker,
    required bool isEmployer,
  }) async {
    state = AsyncValue.loading();

    try {
      await registerUseCase.execute(
        username: username,
        email: email,
        password: password,
        isJobSeeker: isJobSeeker,
        isEmployer: isEmployer,
      );
      state = AsyncValue.data(null);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      rethrow;
    }
  }
}
