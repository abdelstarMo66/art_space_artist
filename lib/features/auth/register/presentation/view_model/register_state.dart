
import 'package:art_space_artist/features/auth/register/data/models/register_response.dart';
import 'package:art_space_artist/features/auth/register/data/models/verify_email_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_state.freezed.dart';
@freezed
class RegisterState<T> with _$RegisterState<T>{
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = Loading;
  const factory RegisterState.success(RegisterResponse data) = Success;
  const factory RegisterState.error({required String error}) = Error;

  const factory RegisterState.verifyEmailLoading() = VerifyEmailLoading;
  const factory RegisterState.verifyEmailSuccess(VerifyEmailResponse data) = VerifyEmailSuccess;
  const factory RegisterState.verifyEmailError({required String error}) = VerifyEmailError;

  const factory RegisterState.addProfileImageInRegister() = AddProfileImageInRegister;
}