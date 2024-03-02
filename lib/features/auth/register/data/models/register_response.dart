import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';
@JsonSerializable()
class RegisterResponse{
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  String? status;
  int? code;

  RegisterResponse({this.userData, this.message, this.status, this.code});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);
}


@JsonSerializable()
class UserData {
  String ? token;
  UserData(this.token);
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}