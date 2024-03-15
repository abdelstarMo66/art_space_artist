
import 'package:json_annotation/json_annotation.dart';
part 'reset_password_request.g.dart';
@JsonSerializable()
class ResetPasswordRequest {
  final String email;
  final String password;
  final String passwordConfirm;

  ResetPasswordRequest({
    required this.email,
    required this.password,
    required this.passwordConfirm,
});
  Map<String , dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}