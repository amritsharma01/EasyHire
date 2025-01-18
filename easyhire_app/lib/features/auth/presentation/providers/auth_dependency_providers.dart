import 'package:easyhire_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:easyhire_app/features/auth/presentation/providers/login_notifier.dart';
import 'package:easyhire_app/features/auth/presentation/providers/register_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core_service_providers.dart';
import '../../data/repository/login_repository_impl.dart';
import '../../data/repository/register_repo_impl.dart';
import '../../domain/repositories/login_repo.dart';
import '../../domain/repositories/register_repo.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final apiManager = ref.read(apiServiceProvider);
  return AuthRemoteDataSource(apiManager); // Inject ApiManager
});

final loginRepoImplProvider = Provider<LoginRepo>((ref) {
  final authRemoteDataSource = ref.read(authRemoteDataSourceProvider);
  return LoginRepoImpl(authRemoteDataSource); // inject auth remote datasource
});

final registerRepoImplProvider = Provider<RegisterRepo>((ref) {
  final authRemoteDataSource = ref.read(authRemoteDataSourceProvider);
  return RegisterRepoImpl(authRemoteDataSource);
});

final loginUsecaseProvider = Provider<LoginUseCase>((ref) {
  final loginRepoImpl = ref.read(loginRepoImplProvider);
  return LoginUseCase(loginRepoImpl);
});

final registerUsecaseProvider = Provider<RegisterUseCase>((ref) {
  final registerRepoImpl = ref.read(registerRepoImplProvider);
  return RegisterUseCase(registerRepoImpl);
});

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) {
    final loginusecaseProvider = ref.read(loginUsecaseProvider);
    final tokenStorageProvider = ref.read(secureStorageProvider);
    return LoginNotifier(loginusecaseProvider, tokenStorageProvider);
  },
);

final registerProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
  final registerUseCase = ref.read(registerUsecaseProvider);
  return RegisterNotifier(registerUseCase);
});
