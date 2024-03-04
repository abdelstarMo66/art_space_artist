import 'package:art_space_artist/core/components/default_button.dart';
import 'package:art_space_artist/core/components/default_text_field.dart';
import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/helpers/validation_helper.dart';
import 'package:art_space_artist/features/auth/forgetPassword/data/model/forget_password_request.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/view_model/forget_password_cubit.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/views/widgets/custom_stack_widget.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/views/widgets/forget_password_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../generated/l10n.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        image: AssetsManager.imgForgetPassword,
        widget: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                S.of(context).forgetPassword,
                style: TextStyles.textStyle30
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).forgetPasswordText,
                style: TextStyles.textStyle18,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Form(
                key: context.read<ForgetPasswordCubit>().formKeyEmailInForgetPassword,
                child: DefaultTextField(
                    controller:
                        context.read<ForgetPasswordCubit>().emailController,
                    hintText: S.of(context).email,
                    validator: (value) {
                      if(value == null || value.isEmpty || !ExtString.isValidEmail(value)){
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    maxLines: 1),
              ),
              const SizedBox(height: 60.0),
              DefaultButton(
                  text: S.of(context).send,
                  onPressed: () {
                    validateThenSendOTP(context);
                  }),
              const ForgetPasswordListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenSendOTP(BuildContext context) {
    if (context.read<ForgetPasswordCubit>().formKeyEmailInForgetPassword.currentState!.validate()) {
      context.read<ForgetPasswordCubit>().emitForgetPasswordStates(
          ForgetPasswordRequest(
              email: context.read<ForgetPasswordCubit>().emailController.text));
    }
  }
}
