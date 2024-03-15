import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';
@JsonSerializable()
class RegisterResponse{
  String? message;
  String? status;
  int? code;

  RegisterResponse({this.message, this.status, this.code});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);
}