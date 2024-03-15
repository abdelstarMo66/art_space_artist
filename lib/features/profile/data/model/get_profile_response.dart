import 'package:json_annotation/json_annotation.dart';
part 'get_profile_response.g.dart';

@JsonSerializable()
class GetProfileResponse {
  String? status;
  String? message;
  int? code;
  @JsonKey(name: 'data')
  ProfileInfo? profileInfo;

  GetProfileResponse({this.profileInfo, this.status, this.code, this.message});
  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfileResponseFromJson(json);
}

@JsonSerializable()
class ProfileInfo {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? email;
  String? phone;
  bool? accountActive;
  List<String>? addresses;

  ProfileInfo(
      {this.email,
      this.phone,
      this.name,
      this.addresses,
      this.accountActive,
      this.id});

  factory ProfileInfo.fromJson(Map<String, dynamic> json) =>
      _$ProfileInfoFromJson(json);
}
