// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponse _$ResetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordResponse(
      userData: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      code: json['code'] as int?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ResetPasswordResponseToJson(
        ResetPasswordResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.userData,
      'status': instance.status,
      'code': instance.code,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      json['token'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'token': instance.token,
    };
