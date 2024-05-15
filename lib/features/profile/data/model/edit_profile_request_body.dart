
import 'package:json_annotation/json_annotation.dart';
part 'edit_profile_request_body.g.dart';
@JsonSerializable()
class EditProfileRequestBody {
  String? name;
  String? bio;
  String? phone;

  EditProfileRequestBody({required this.name,required this.bio,required this.phone});

  Map<String , dynamic> toJson() => _$EditProfileRequestBodyToJson(this);
}