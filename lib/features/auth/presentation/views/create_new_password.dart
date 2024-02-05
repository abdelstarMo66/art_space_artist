import 'package:art_space_artist/core/components/default_button.dart';
import 'package:art_space_artist/core/components/default_text_field.dart';
import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/features/auth/presentation/views/widgets/custom_stack_widget.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorManager.primaryColor),
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
                DefaultTextField(
                    controller: passwordController,
                    hintText: S.of(context).enterNewPassword,
                    validator: (value) {
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    maxLines: 1),
                const SizedBox(height: 20.0),
                DefaultTextField(
                    controller: confirmPasswordController,
                    hintText: S.of(context).confirmNewPassword,
                    validator: (value) {
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    maxLines: 1),
                const SizedBox(
                  height: 40.0,
                ),
                DefaultButton(
                    text: 'Change password',
                    onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }
}
