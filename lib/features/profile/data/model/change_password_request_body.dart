import 'package:json_annotation/json_annotation.dart';
part 'change_password_request_body.g.dart';

@JsonSerializable()
class ChangePasswordRequestBody {
  String? currentPassword;
  String? password;
  String? confirmPassword;

  ChangePasswordRequestBody({
    required this.currentPassword,
    required this.password,
    required this.confirmPassword,
  });

  Map<String , dynamic> toJson() => _$ChangePasswordRequestBodyToJson(this);
}