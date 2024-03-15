import 'package:art_space_artist/features/auth/register/data/models/register_request_body.dart';
import 'package:art_space_artist/features/auth/register/data/repo/register_repo.dart';
import 'package:art_space_artist/features/auth/register/presentation/view_model/register_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());

  final formKey = GlobalKey<FormState>();
  final formKeyVerifyEmail = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailAddressController = TextEditingController();
  var phoneController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  void emitRegisterStates(RegisterRequestBody registerRequestBody) async {
    emit(const RegisterState.loading());
    final response = await _registerRepo.register(registerRequestBody);
    response.when(success: (data) {
      emit(RegisterState.success(response));
    }, failure: (error) {
      emit(RegisterState.error(error: error));
    });
  }
}
