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
  final String gender;

  RegisterRequestBody({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirm,
    required this.profileImg,
    required this.gender
  });

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
