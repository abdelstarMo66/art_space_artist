
import 'package:json_annotation/json_annotation.dart';
part 'verify_email_response.g.dart';
@JsonSerializable()
class VerifyEmailResponse {
  String ? message;
  int? code;
  String ? status;

  VerifyEmailResponse({this.message, this.status, this.code});

  factory VerifyEmailResponse.fromJson(Map <String, dynamic> json) =>
      _$VerifyEmailResponseFromJson(json);
}