// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmailRequestBody _$VerifyEmailRequestBodyFromJson(
        Map<String, dynamic> json) =>
    VerifyEmailRequestBody(
      email: json['email'] as String,
      activateCode: json['activateCode'] as String,
    );

Map<String, dynamic> _$VerifyEmailRequestBodyToJson(
        VerifyEmailRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'activateCode': instance.activateCode,
    };
