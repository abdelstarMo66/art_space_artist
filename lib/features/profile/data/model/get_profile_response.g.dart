// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileResponse _$GetProfileResponseFromJson(Map<String, dynamic> json) =>
    GetProfileResponse(
      profileInfo: json['data'] == null
          ? null
          : ProfileInfo.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      code: json['code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetProfileResponseToJson(GetProfileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.profileInfo,
    };

ProfileInfo _$ProfileInfoFromJson(Map<String, dynamic> json) => ProfileInfo(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      accountActive: json['accountActive'] as bool?,
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$ProfileInfoToJson(ProfileInfo instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'accountActive': instance.accountActive,
      'addresses': instance.addresses,
    };
