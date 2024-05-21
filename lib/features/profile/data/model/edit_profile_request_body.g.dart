// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequestBody _$EditProfileRequestBodyFromJson(
        Map<String, dynamic> json) =>
    EditProfileRequestBody(
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$EditProfileRequestBodyToJson(
        EditProfileRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bio': instance.bio,
      'phone': instance.phone,
    };
