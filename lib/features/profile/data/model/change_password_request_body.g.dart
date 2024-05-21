// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequestBody _$ChangePasswordRequestBodyFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordRequestBody(
      currentPassword: json['currentPassword'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
    );

Map<String, dynamic> _$ChangePasswordRequestBodyToJson(
        ChangePasswordRequestBody instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
