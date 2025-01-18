import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core_service_providers.dart';
import '../../data/datasource/user_remote_data_source.dart';
import '../../data/repository/user_repo_impl.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/user_repo.dart';
import '../../domain/usecase/user_profile_usecase.dart';
import 'user_notifier.dart';

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  final apiProvider = ref.watch(apiServiceProvider);
  return UserRemoteDataSource(apiProvider);
});

// Usage with Riverpod
final userRepoImplProvider = Provider<UserRepo>((ref) {
  final storageService = ref.watch(storageServiceProvider);
  final remoteDataSource = ref.watch(userRemoteDataSourceProvider);

  return UserRepoImpl(
    remoteDataSource,
    storageService,
  );
});

final getUserProfileProvider = Provider<GetUserProfileUseCase>(
  (ref) => GetUserProfileUseCase(ref.watch(userRepoImplProvider)),
);

final getLocalUserProvider = Provider<GetLocalUserUseCase>(
  (ref) => GetLocalUserUseCase(ref.watch(userRepoImplProvider)),
);

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<UserEntity>>((ref) {
  final getUserProfileUseCase = ref.watch(getUserProfileProvider);
  final storageService = ref.watch(storageServiceProvider);
  return UserNotifier(getUserProfileUseCase, storageService);
});
