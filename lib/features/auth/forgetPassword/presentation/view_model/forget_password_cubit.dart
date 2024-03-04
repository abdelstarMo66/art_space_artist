import 'package:art_space_artist/features/auth/forgetPassword/data/model/forget_password_request.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/verify_email_request.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/repo/forget_password_repo.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/view_model/forget_password_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo _forgetPasswordRepo;
  ForgetPasswordCubit(this._forgetPasswordRepo)
      : super(const ForgetPasswordState.initial());

  void emitForgetPasswordStates(
    ForgetPasswordRequest forgetPasswordRequest,
  ) async {
    emit(const ForgetPasswordState.loading());
    final response =
        await _forgetPasswordRepo.forgetPassword(forgetPasswordRequest);
    response.when(success: (forgetPasswordResponse) {
      emit(ForgetPasswordState.success(forgetPasswordResponse));
    }, failure: (error) {
      emit(ForgetPasswordState.error(error: error));
    });
  }

  void emitVerifyEmailStates(
      VerifyEmailRequest verifyEmailRequest
      ) async {
    emit(const ForgetPasswordState.verifyEmailLoading());
    final response = await _forgetPasswordRepo.verifyEmail(verifyEmailRequest);
    response.when(success: (verifyEmailResponse) {
      emit(ForgetPasswordState.verifyEmailSuccess(verifyEmailResponse));
    }, failure: (error) {
      emit(ForgetPasswordState.verifyEmailError(error: error));
    });
  }



  final formKeyEmailInForgetPassword = GlobalKey<FormState>();
  final formKeyOTP = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var otpController = TextEditingController();
}
