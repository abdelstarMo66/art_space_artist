import 'package:json_annotation/json_annotation.dart';
part 'verify_email_request.g.dart';
@JsonSerializable()
class VerifyCodeRequest {
  final String email;
 final String resetCode;
  VerifyCodeRequest({required this.email, required this.resetCode});

  Map<String , dynamic> toJson() => _$VerifyCodeRequestToJson(this);
}