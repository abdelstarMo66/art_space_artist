import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/enums.dart';
import 'package:art_space_artist/core/constants/toast_color.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/view_model/forget_password_cubit.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/view_model/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordListener extends StatelessWidget {
  const ForgetPasswordListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listenWhen: (previous, current) => current is Loading || current is Success || current is Error,
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              showDialog(
                  context: context,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primaryColor,
                    ),
                  ));
            },
            success: (data) {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(
                  AppRouterNames.verifyEmailOPT,
              );
            },
            error: (error) {
              Navigator.of(context).pop();
              showToast(
                  msg: error,
                  state: ToastState.error);
            },
          );

        },
    child: const SizedBox.shrink(),
    );
  }
}
