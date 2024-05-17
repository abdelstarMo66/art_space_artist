import 'package:art_space_artist/core/helpers/validation_helper.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/view_model/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/components/default_text_field.dart';
import '../../../../../../generated/l10n.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ForgetPasswordCubit>();
    return Form(
        key: cubit.formKeyResetPassword,
        child: Column(
          children: [
            DefaultTextField(
                controller: cubit.newPasswordController,
                hintText: S.of(context).enterNewPassword,
                validator: (value) {
                  if (value == null) {
                    return 'Please enter valid password';
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                maxLines: 1),
            const SizedBox(height: 20.0),
            DefaultTextField(
                controller: cubit.confirmNewPasswordController,
                hintText: S.of(context).confirmNewPassword,
                validator: (value) {
                  if (cubit.newPasswordController.text !=
                      cubit.confirmNewPasswordController.text) {
                    return 'confirm password incorrect';
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                maxLines: 1),
          ],
        ));
  }
}
