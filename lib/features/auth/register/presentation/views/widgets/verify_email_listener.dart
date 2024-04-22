import 'package:art_space_artist/features/auth/register/presentation/view_model/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/color_manager.dart';
import '../../../../../../core/constants/const_method.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/router/app_router_names.dart';
import '../../view_model/register_cubit.dart';

class VerifyEmailListener extends StatelessWidget {
  const VerifyEmailListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is VerifyEmailLoading ||
          current is VerifyEmailSuccess ||
          current is VerifyEmailError,
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
          success: (data) {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(AppRouterNames.home);
          },
          error: (error) {
            Navigator.of(context).pop();
            showToast('Error ya3m zeft', ToastState.error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
