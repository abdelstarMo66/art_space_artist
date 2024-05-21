// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_subject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSubjectResponse _$GetSubjectResponseFromJson(Map<String, dynamic> json) =>
    GetSubjectResponse(
      status: json['status'] as String?,
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      subjectData: (json['data'] as List<dynamic>?)
          ?.map((e) => SubjectData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSubjectResponseToJson(GetSubjectResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.subjectData,
    };

SubjectData _$SubjectDataFromJson(Map<String, dynamic> json) => SubjectData(
      id: json['id'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$SubjectDataToJson(SubjectData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
