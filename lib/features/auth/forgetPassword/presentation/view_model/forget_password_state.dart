
import 'package:freezed_annotation/freezed_annotation.dart';
part 'forget_password_state.freezed.dart';
@freezed
class ForgetPasswordState<T> with _$ForgetPasswordState<T> {
  const factory ForgetPasswordState.initial() = _Initial;
  const factory ForgetPasswordState.loading() = Loading;
  const factory ForgetPasswordState.success(T data) = Success;
  const factory ForgetPasswordState.error({
    required String error
}) = Error;

  const factory ForgetPasswordState.verifyEmailLoading() = VerfiyEmailLoading;
  const factory ForgetPasswordState.verifyEmailSuccess(T data) = VerfiyEmailSuccess;
  const factory ForgetPasswordState.verifyEmailError({
    required String error
}) = VerfiyEmailError;
}