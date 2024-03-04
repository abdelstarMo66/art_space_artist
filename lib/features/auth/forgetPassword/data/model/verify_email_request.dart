import 'package:json_annotation/json_annotation.dart';
part 'verify_email_request.g.dart';
@JsonSerializable()
class VerifyEmailRequest {
  final String email;
 final String resetCode;
  VerifyEmailRequest({required this.email, required this.resetCode});

  Map<String , dynamic> toJson() => _$VerifyEmailRequestToJson(this);
}