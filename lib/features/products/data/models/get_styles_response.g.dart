// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_styles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStylesResponse _$GetStylesResponseFromJson(Map<String, dynamic> json) =>
    GetStylesResponse(
      status: json['status'] as String?,
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      stylesData: (json['data'] as List<dynamic>?)
          ?.map((e) => StylesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetStylesResponseToJson(GetStylesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.stylesData,
    };

StylesData _$StylesDataFromJson(Map<String, dynamic> json) => StylesData(
      id: json['id'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$StylesDataToJson(StylesData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
