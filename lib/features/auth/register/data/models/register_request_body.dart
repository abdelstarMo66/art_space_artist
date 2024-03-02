import 'package:json_annotation/json_annotation.dart';
part 'register_request_body.g.dart';
@JsonSerializable()
class RegisterRequestBody {
  final String name;
  final String email;
  final String password;
  final String passwordConfirm;
  final String phone;
  final String profileImg;

  RegisterRequestBody({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirm,
    required this.profileImg,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
