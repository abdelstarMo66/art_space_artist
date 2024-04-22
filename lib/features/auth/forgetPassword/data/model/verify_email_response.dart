
import 'package:json_annotation/json_annotation.dart';
part 'verify_email_response.g.dart';
@JsonSerializable()
class VerifyCodeResponse {
  String ? message;
  int? code;
  String ? status;

  VerifyCodeResponse({this.message, this.status, this.code});

  factory VerifyCodeResponse.fromJson(Map <String, dynamic> json) =>
      _$VerifyCodeResponseFromJson(json);
}