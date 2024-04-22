
import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_state.freezed.dart';
@freezed
class RegisterState<T> with _$RegisterState<T>{
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = Loading;
  const factory RegisterState.success(T data) = Success<T>;
  const factory RegisterState.error({required String error}) = Error;

  const factory RegisterState.verifyEmailLoading() = VerifyEmailLoading;
  const factory RegisterState.verifyEmailSuccess(T data) = VerifyEmailSuccess<T>;
  const factory RegisterState.verifyEmailError({required String error}) = VerifyEmailError;
}