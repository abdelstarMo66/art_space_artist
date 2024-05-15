import 'package:json_annotation/json_annotation.dart';
part 'get_subject_response.g.dart';

@JsonSerializable()
class GetSubjectResponse {
  String? status;
  int? code;
  String? message;
  @JsonKey(name: 'data')
  List<SubjectData>? subjectData;

  GetSubjectResponse({this.status, this.code, this.message, this.subjectData});

  factory GetSubjectResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSubjectResponseFromJson(json);
}

@JsonSerializable()
class SubjectData {
  String? id;
  String? title;

  SubjectData({this.id, this.title});

  factory SubjectData.fromJson(Map<String, dynamic> json) =>
      _$SubjectDataFromJson(json);
}
