import 'package:json_annotation/json_annotation.dart';

part 'change_password_response.g.dart';
@JsonSerializable()
class ChangePasswordResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  String? status;
  int? code;

  ChangePasswordResponse({this.userData, this.message, this.code, this.status});

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) => _$ChangePasswordResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String ? token;
  UserData(this.token);
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}