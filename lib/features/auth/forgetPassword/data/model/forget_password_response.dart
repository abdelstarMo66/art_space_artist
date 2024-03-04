import 'package:json_annotation/json_annotation.dart';
part 'forget_password_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse {
  String? message;
  int? code;
  String? status;

  ForgetPasswordResponse({this.code, this.status, this.message});

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);
}
