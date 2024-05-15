import 'package:art_space_artist/core/components/default_button.dart';
import 'package:art_space_artist/core/components/default_text_field.dart';
import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/helpers/validation_helper.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/profile_state.dart';
import 'package:art_space_artist/features/profile/presentation/views/change_password/widgets/change_password_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/color_manager.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(AppRouterNames.home),
          child: SvgPicture.asset(
            AssetsManager.icBackArrow,
          ),
        ),
        leadingWidth: 35,
        title: const Text('Change Password'),
        backgroundColor: ColorManager.originalWhite,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: context.read<ProfileCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DefaultTextField(
                  controller:
                      context.read<ProfileCubit>().currentPasswordController,
                  hintText: 'Enter your current password',
                  validator: (value) => oldPasswordValidation(value),
                  keyboardType: TextInputType.name,
                  obscureText: true,
                  maxLines: 1,
                  icon: Icons.remove_red_eye,
                  onPressedIcon: () {},
                ),
                const SizedBox(
                  height: 25,
                ),
                DefaultTextField(
                  controller:
                      context.read<ProfileCubit>().newPasswordController,
                  hintText: 'Enter your new password',
                  validator: (value) => newPasswordValidation(value),
                  keyboardType: TextInputType.name,
                  obscureText: true,
                  maxLines: 1,
                  icon: Icons.remove_red_eye,
                  onPressedIcon: () {},
                ),
                const SizedBox(
                  height: 25,
                ),
                DefaultTextField(
                  controller:
                      context.read<ProfileCubit>().confirmPasswordController,
                  hintText: 'confirm your new password',
                  validator: (value) => confirmPasswordValidation(
                    value,
                    context.read<ProfileCubit>().confirmPasswordController.text,
                  ),
                  keyboardType: TextInputType.name,
                  obscureText: true,
                  maxLines: 1,
                  icon: Icons.remove_red_eye,
                  onPressedIcon: () {},
                ),
                const SizedBox(
                  height: 65,
                ),
                DefaultButton(
                    text: 'Save',
                    onPressed: () {
                      validateThenChangePassword(context);
                    }),
                const ChangePasswordListener(),
              ],
            ),
          ),
        );
      }),
    );
  }

  String? oldPasswordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return "Please Enter a valid password";
    } else {
      return null;
    }
  }

  String? newPasswordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return "Please Enter a valid password";
    } else if (password.length < 8) {
      return "password too short, minimum 8 characters";
    } else if (ExtString.isValidPassword(password)) {
      return "Please Enter a strong password";
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(String? confirmPassword, String password) {
    if (password != confirmPassword) {
      return "password confirmation not match password";
    } else {
      return null;
    }
  }

  void validateThenChangePassword(BuildContext context) {
    if (context.read<ProfileCubit>().formKey.currentState!.validate()) {
      context.read<ProfileCubit>().emitChangePassword();
    }
  }
}
