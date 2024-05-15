import 'package:art_space_artist/core/helpers/cache_helper.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/profile/data/model/get_profile_response.dart';
import 'package:art_space_artist/features/profile/data/repo/profile_repo.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/profile_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../data/model/change_password_request_body.dart';
import '../../data/model/edit_profile_request_body.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;

  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  GetProfileResponse? myProfile;

  void emitGetProfileStates() async {
    emit(const ProfileState.getProfileLoading());
    final response = await _profileRepo.getProfile();
    response.when(
      success: (getProfileResponse) {
        myProfile = getProfileResponse;
        emit(ProfileState.getProfileSuccess(getProfileResponse));
      },
      failure: (error) {
        emit(ProfileState.getProfileError(error: error));
      },
    );
  }

  void emitLogout({required context}) {
    CacheHelper.removeData(key: 'token');
    emit(const ProfileState.logout());
    Navigator.of(context).pushReplacementNamed(AppRouterNames.login);
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  void emitUpdateProfile() async {
    emit(const ProfileState.editProfileLoading());
    final response = await _profileRepo.editProfile(
        editProfileRequestBody: EditProfileRequestBody(
      name: nameController.text == ""
          ? myProfile!.profileInfo!.name
          : nameController.text,
      bio: bioController.text == ""
          ? myProfile!.profileInfo!.bio
          : bioController.text,
      phone: phoneController.text == ""
          ? myProfile!.profileInfo!.phone
          : phoneController.text,
    ));
    response.when(
      success: (getProfileResponse) {
        emit(ProfileState.editProfileSuccess(getProfileResponse));
        emitGetProfileStates();
      },
      failure: (error) {
        emit(ProfileState.editProfileError(error: error));
      },
    );
  }

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void emitChangePassword() async {
    emit(const ProfileState.changePasswordLoading());
    final response = await _profileRepo.changePassword(
        changePasswordRequestBody: ChangePasswordRequestBody(
      currentPassword: currentPasswordController.text,
      password: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
    ));
    response.when(success: (getProfileResponse) {
      emit(ProfileState.changePasswordSuccess(getProfileResponse));
      CacheHelper.removeData(key: 'token');
      CacheHelper.saveDataSharedPreference(
        key: 'token',
        value: getProfileResponse.userData!.token,
      );
    }, failure: (error) {
      emit(ProfileState.changePasswordError(error: error));
    });
  }

}
