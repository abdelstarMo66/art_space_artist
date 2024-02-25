import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';
@JsonSerializable()
class LoginResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  String? status;
  int? code;

  LoginResponse({this.userData, this.message, this.code, this.status});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String ? token;
   UserData(this.token);
   factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}