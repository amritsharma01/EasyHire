import 'package:easyhire_app/abstractservices/storage_services.dart';
import 'package:easyhire_app/core/services/api_services/api_services.dart';

import '../../../../core/services/storage_services/hive_keys.dart';
import '../model/user_model.dart';

class UserLocalDataSource {
  final ApiManager apiManager;
  final StorageServices storageServices;

  UserLocalDataSource(this.apiManager, this.storageServices);

  getLocalUser() {
    final userJson = storageServices.get(StorageKeys.user);
    if (userJson != null) {
      return UserModel.fromJson(Map<String, dynamic>.from(userJson));
    }
    return null;
  }
}
