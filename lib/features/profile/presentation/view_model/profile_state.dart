import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_state.freezed.dart';

@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.getProfileLoading() = GetProfileLoading;
  const factory ProfileState.getProfileSuccess(T data) = GetProfileSuccess;
  const factory ProfileState.getProfileError({required String error}) =
      GetProfileError;

  const factory ProfileState.logout() = Logout;

  const factory ProfileState.editProfileLoading() = EditProfileLoading;
  const factory ProfileState.editProfileSuccess(T data) = EditProfileSuccess;
  const factory ProfileState.editProfileError({required String error}) =
      EditProfileError;

  const factory ProfileState.changePasswordLoading() = ChangePasswordLoading;
  const factory ProfileState.changePasswordSuccess(T data) = ChangePasswordSuccess;
  const factory ProfileState.changePasswordError({required String error}) =
      ChangePasswordError;
}
