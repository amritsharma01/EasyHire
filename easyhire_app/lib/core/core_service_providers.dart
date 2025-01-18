import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../abstractservices/storage_services.dart';
import 'configs/app_theme_provider.dart';
import 'services/api_services/api_services.dart';
import 'services/get.dart';
import 'services/storage_services/token_storage_service.dart';

final platformProvider = ValueNotifier<PlatformStyle>(PlatformStyle.Material);

//storage service dependencies
final storageServiceProvider = Provider<StorageServices>((ref) {
  final box = Get.box;
  ref.onDispose(() => box.close);
  return box;
});

final apiServiceProvider = Provider<ApiManager>((ref) {
  final tokenProvider = ref.watch(secureStorageProvider);
  return ApiManager(ref, tokenProvider);
});

final themeModeProvider = ChangeNotifierProvider<ThemeProvider>(
    (ref) => ThemeProvider(ref.watch(storageServiceProvider)));

final secureStorageProvider = Provider<TokenStorage>((ref) {
  return TokenStorage(ref);
});
