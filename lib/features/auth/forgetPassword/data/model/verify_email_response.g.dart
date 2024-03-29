// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmailResponse _$VerifyEmailResponseFromJson(Map<String, dynamic> json) =>
    VerifyEmailResponse(
      message: json['message'] as String?,
      status: json['status'] as String?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$VerifyEmailResponseToJson(
        VerifyEmailResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'status': instance.status,
    };
