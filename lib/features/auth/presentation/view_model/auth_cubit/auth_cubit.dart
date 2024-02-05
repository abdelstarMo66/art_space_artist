import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  bool showPassword = true;

  void changeVisibilityPassword () {
    showPassword =! showPassword;
    emit(ChangeVisibilityPasswordState());
  }
}
