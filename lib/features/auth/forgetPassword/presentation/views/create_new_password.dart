import 'package:art_space_artist/core/components/default_button.dart';
import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/reset_password_request.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/view_model/forget_password_cubit.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/views/widgets/custom_stack_widget.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/views/widgets/reset_password_form.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/views/widgets/reset_password_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../generated/l10n.dart';

class CreateNewPassword extends StatelessWidget {
  final String email;
  const CreateNewPassword({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ForgetPasswordCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            AssetsManager.icBackArrow,
            height: 40,
          ),
        ),
      ),
      backgroundColor: ColorManager.thirdColor,
      body: CustomStackWidget(
          image: AssetsManager.imgResetPassword,
          widget: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  S.of(context).createNewPassword,
                  style: TextStyles.textStyle24.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.secondaryColor,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  S.of(context).createNewPasswordText,
                  style: TextStyles.textStyle16,
                ),
                const SizedBox(
                  height: 40,
                ),
                const ResetPasswordForm(),
                const SizedBox(
                  height: 40.0,
                ),
                DefaultButton(
                  text: 'Change password',
                  onPressed: () {
                    if (cubit.formKeyResetPassword.currentState!.validate()) {
                      cubit.emitResetPasswordStates(ResetPasswordRequest(
                          email: email,
                          password: cubit.newPasswordController.text,
                          passwordConfirm:
                              cubit.confirmNewPasswordController.text));
                    }
                  },
                ),
                const ResetPasswordListener()
              ],
            ),
          )),
    );
  }
}
