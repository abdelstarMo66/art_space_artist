import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/constants/toast_color.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordListener extends StatelessWidget {
  const ChangePasswordListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
      current is ChangePasswordLoading || current is ChangePasswordSuccess || current is ChangePasswordError,
      listener: (context, state) {
        state.whenOrNull(
          changePasswordLoading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primaryColor,
                  )),
            );
          }, changePasswordSuccess: (loginResponse) {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(
            AppRouterNames.home,
          );
        }, changePasswordError: (error) {
          Navigator.of(context).pop();
          showToast(
            msg: error,
            state: ToastState.error,
          );
        },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
