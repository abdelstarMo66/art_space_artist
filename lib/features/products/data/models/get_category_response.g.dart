// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoryResponse _$GetCategoryResponseFromJson(Map<String, dynamic> json) =>
    GetCategoryResponse(
      status: json['status'] as String?,
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      categoryData: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCategoryResponseToJson(
        GetCategoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.categoryData,
    };

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) => CategoryData(
      id: json['id'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
