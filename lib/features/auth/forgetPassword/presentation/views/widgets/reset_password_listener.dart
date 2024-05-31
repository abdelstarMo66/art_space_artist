import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/constants/toast_color.dart';
import 'package:art_space_artist/core/network/api_error_handler.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/view_model/forget_password_cubit.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/view_model/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constants/color_manager.dart';

class ResetPasswordListener extends StatelessWidget {
  const ResetPasswordListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listenWhen: (previous, current) =>
          current is ResetPasswordLoading ||
          current is ResetPasswordSuccess ||
          current is ResetPasswordError,
      listener: (context, state) {
        state.whenOrNull(
          resetPasswordLoading: () => showDialog(
              context: context,
              builder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primaryColor,
                    ),
                  )),
          resetPasswordSuccess: (resetPasswordResponse) {
            Navigator.of(context).pop();
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRouterNames.home, (route) => false);
          },
          resetPasswordError: (error) {
            Navigator.of(context).pop();
            showToast(msg: '${ServerFailure(error)}', state: ToastState.error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
