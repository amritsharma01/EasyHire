import 'package:easyhire_app/features/auth/domain/entities/token_entity.dart';

class TokenModel extends TokenEntity {
  TokenModel({
    required super.access,
    required super.refresh,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      access: json["access"] as String,
      refresh: json["refresh"] as String,
    );
  }
}
