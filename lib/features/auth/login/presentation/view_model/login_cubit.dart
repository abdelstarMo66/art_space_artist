import 'package:art_space_artist/core/helpers/cache_helper.dart';
import 'package:art_space_artist/features/auth/login/data/model/login_request_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/Login_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _authRepo;
  LoginCubit(this._authRepo) : super(const LoginState.initial());

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _authRepo.login(loginRequestBody);
    response.when(success: (data) {
      CacheHelper.saveDataSharedPreference(
          key: 'token', value: data.userData!.token);
      emit(LoginState.success(data));
    }, failure: (error) {
      emit(LoginState.error(error: error.toString()));
    });
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isSecure = true;

  void changeVisibilityPassword() {
    isSecure = !isSecure;
    emit(const LoginState.changeVisiblePassword());
  }
}
