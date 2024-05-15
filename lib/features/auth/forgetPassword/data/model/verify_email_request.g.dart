// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeRequest _$VerifyCodeRequestFromJson(Map<String, dynamic> json) =>
    VerifyCodeRequest(
      email: json['email'] as String,
      resetCode: json['resetCode'] as String,
    );

Map<String, dynamic> _$VerifyCodeRequestToJson(VerifyCodeRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'resetCode': instance.resetCode,
    };
