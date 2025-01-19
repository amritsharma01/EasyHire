import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core_service_providers.dart';
import '../../data/datasource/user_local_data_source.dart';
import '../../data/datasource/user_remote_data_source.dart';
import '../../data/repository/user_repo_impl.dart';

import '../../domain/repository/user_repo.dart';
import '../../domain/usecase/user_profile_usecase.dart';
import 'user_notifier.dart';

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  final apiProvider = ref.read(apiServiceProvider);
  return UserRemoteDataSource(apiProvider);
});

final userLocalDataSourceProvider = Provider<UserLocalDataSource>((ref) {
  final apiProvider = ref.read(apiServiceProvider);
  final storageService = ref.read(storageServiceProvider);
  return UserLocalDataSource(apiProvider, storageService);
});

// Usage with Riverpod
final userRepoImplProvider = Provider<UserRepo>((ref) {
  final remoteDataSource = ref.read(userRemoteDataSourceProvider);
  final localDatasource = ref.read(userLocalDataSourceProvider);

  return UserRepoImpl(remoteDataSource, localDatasource);
});

final getUserProfileProvider = Provider<GetUserProfileUseCase>(
  (ref) => GetUserProfileUseCase(ref.read(userRepoImplProvider)),
);

final getLocalUserProvider = Provider<GetLocalUserUseCase>(
  (ref) => GetLocalUserUseCase(ref.watch(userRepoImplProvider)),
);

final userNotifierProvider =
    StateNotifierProvider<UserStateNotifier, UserState>((ref) {
  final getUserProfileUseCase = ref.read(getUserProfileProvider);
  final getLocalUserProfileUseCase = ref.read(getLocalUserProvider);
  final storageService = ref.read(storageServiceProvider);
  return UserStateNotifier(
      getUserProfileUseCase, storageService, getLocalUserProfileUseCase);
});
