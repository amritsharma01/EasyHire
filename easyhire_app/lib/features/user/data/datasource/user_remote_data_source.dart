import 'package:easyhire_app/core/services/api_services/api_services.dart';
import 'package:easyhire_app/core/utils/api_endpoints.dart';
import 'package:easyhire_app/features/user/domain/entity/user_entity.dart';

import '../model/user_model.dart';

class UserRemoteDataSource {
  final ApiManager apiManager;

  UserRemoteDataSource(this.apiManager);

  Future<UserEntity> fetchUserProfile() async {
    try {
      final response = await apiManager.get(ApiEndpoints.profile);
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error Connecting to Server');
    }
  }
}
