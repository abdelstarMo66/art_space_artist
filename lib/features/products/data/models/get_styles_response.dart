import 'package:json_annotation/json_annotation.dart';
part 'get_styles_response.g.dart';

@JsonSerializable()
class GetStylesResponse {
  String? status;
  int? code;
  String? message;
  @JsonKey(name: 'data')
  List<StylesData>? stylesData;

  GetStylesResponse({this.status, this.code, this.message, this.stylesData});

  factory GetStylesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStylesResponseFromJson(json);
}

@JsonSerializable()
class StylesData {
  String? id;
  String? title;

  StylesData({this.id, this.title});

  factory StylesData.fromJson(Map<String, dynamic> json) =>
      _$StylesDataFromJson(json);
}
