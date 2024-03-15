import 'package:json_annotation/json_annotation.dart';
part 'reset_password_response.g.dart';
@JsonSerializable()
class ResetPasswordResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  String? status;
  int? code;

  ResetPasswordResponse({this.userData, this.message, this.code, this.status});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) => _$ResetPasswordResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String ? token;
  UserData(this.token);
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}