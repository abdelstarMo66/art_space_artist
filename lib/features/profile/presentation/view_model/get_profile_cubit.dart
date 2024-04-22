
import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/helpers/cache_helper.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/profile/data/model/get_profile_response.dart';
import 'package:art_space_artist/features/profile/data/repo/get_profile_repo.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/get_profile_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  final GetProfileRepo _getProfileRepo;

  GetProfileCubit(this._getProfileRepo) : super(const GetProfileState.initial());


  GetProfileResponse ?myProfile;

  void emitGetProfileStates() async {
    emit(const GetProfileState.loading());
    final response = await _getProfileRepo.getProfile();
    response.when(
        success: (getProfileResponse) {
          print(getProfileResponse.profileInfo!.phone);
          myProfile = getProfileResponse;
          emit(GetProfileState.success(getProfileResponse));
        },
        failure: (error) {
          emit(GetProfileState.error(error: error));
        },
    );
  }

  void emitLogout({required context}) {
    CacheHelper.removeData(key: 'token');
    emit(const GetProfileState.logout());
    Navigator.of(context).pushReplacementNamed(AppRouterNames.login);
  }
}