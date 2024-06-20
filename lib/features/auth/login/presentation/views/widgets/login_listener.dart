import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/constants/toast_color.dart';
import 'package:art_space_artist/core/network/api_error_handler.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:art_space_artist/features/auth/login/presentation/view_model/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginListener extends StatelessWidget {
  const LoginListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading ||
          current is Success ||
          current is Error ||
          current is ShowPassword,
      listener: (context, state) {

        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                  child: CircularProgressIndicator(
                color: ColorManager.primaryColor,
              )),
            );
          },
          success: (loginResponse) {
            Navigator.of(context).pop();
            Navigator.of(context)
                .pushNamedAndRemoveUntil(
                AppRouterNames.home, (route) => false
            );
          },
          error: (error) {
            Navigator.of(context).pop();
            showToast(
              msg: error,
              state: ToastState.error,
            );
          },
          changeVisiblePassword: () {
            context.read<LoginCubit>().isSecure = false;
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
