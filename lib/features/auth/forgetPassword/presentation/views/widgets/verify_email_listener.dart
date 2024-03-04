import 'package:art_space_artist/core/constants/enums.dart';
import 'package:art_space_artist/core/constants/toast_color.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/view_model/forget_password_cubit.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/view_model/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/color_manager.dart';

class VerifyEmailListener extends StatelessWidget {
  const VerifyEmailListener({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listenWhen: (previous, current) => current is VerfiyEmailLoading || current is VerfiyEmailSuccess || current is VerfiyEmailError,
        listener: (context, state) {
          state.whenOrNull(
            verifyEmailLoading: () {
              showDialog(
                  context: context,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primaryColor,
                    ),
                  ));
            },
            verifyEmailSuccess: (data) {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AppRouterNames.createNewPassword);
            },
            verifyEmailError: (error) {
              Navigator.of(context).pop();
              showToast(msg: error, state: ToastState.error);
            },
          );
        },
    child: const SizedBox.shrink(),
    );
  }
}
