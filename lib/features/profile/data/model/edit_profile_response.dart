import 'package:json_annotation/json_annotation.dart';
part 'edit_profile_response.g.dart';
@JsonSerializable()
class EditProfileResponse {
  String ? status;
  int ? code;
  String ? message;

  EditProfileResponse({this.status, this.code, this.message});

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) => _$EditProfileResponseFromJson(json);

}