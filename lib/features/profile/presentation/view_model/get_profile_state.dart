import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_profile_state.freezed.dart';
@freezed
class GetProfileState<T> with _$GetProfileState<T> {
  const factory GetProfileState.initial() = _Initial;
  const factory GetProfileState.loading() = Loading;
  const factory GetProfileState.success(T data) = Success;
  const factory GetProfileState.error({required String error}) = Error;

  const factory GetProfileState.logout() = Logout;
}