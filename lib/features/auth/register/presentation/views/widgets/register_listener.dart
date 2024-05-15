import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/const_method.dart';
import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/auth/register/presentation/view_model/register_cubit.dart';
import 'package:art_space_artist/features/auth/register/presentation/view_model/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterListener extends StatelessWidget {
  const RegisterListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
        listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              showDialog(
                context: context,
                builder: (context) => const Center(child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                )
                ),
              );
            },
            success: (data) {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AppRouterNames.verifyEmail);
            },
            error: (error) {
              Navigator.of(context).pop();
              showToast(
                  'Error ya3m zeft', ToastState.error);
            },
          );
        },
    child: const SizedBox.shrink(),
    );
  }
}
