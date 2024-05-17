import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/views/widgets/custom_stack_widget.dart';
import 'package:art_space_artist/features/auth/register/data/models/verify_email_request_body.dart';
import 'package:art_space_artist/features/auth/register/presentation/view_model/register_cubit.dart';
import 'package:art_space_artist/features/auth/register/presentation/views/widgets/verify_email_listener.dart';
import 'package:art_space_artist/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/components/default_button.dart';
import '../../../../../core/constants/text_style.dart';

class VerifyEmailScreen extends StatelessWidget {
  final String email;

  const VerifyEmailScreen({super.key, required this.email});

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
        image: AssetsManager.imgVerifyEmail,
        widget: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                S.of(context).verifyYourEmail,
                style: TextStyles.textStyle30
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).verifyYourEmailText,
                style: TextStyles.textStyle18,
              ),
              const SizedBox(
                height: 30.0,
              ),
              const SizedBox(height: 40.0),
              Form(
                key: context.read<RegisterCubit>().formKeyVerifyEmail,
                child: PinCodeTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter code';
                    }
                    return null;
                  },
                  appContext: context,
                  animationCurve: Curves.easeInOut,
                  cursorColor: ColorManager.originalBlack,
                  keyboardType: TextInputType.number,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.scale,
                  textStyle: TextStyles.textStyle16,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(3),
                    fieldHeight: 54,
                    fieldWidth: 54,
                    borderWidth: 1.2,
                    activeFillColor: ColorManager.originalWhite,
                    inactiveFillColor: ColorManager.originalWhite,
                    activeColor: ColorManager.primaryColor,
                    inactiveColor: ColorManager.thirdColor,
                    selectedFillColor: ColorManager.originalWhite,
                    selectedColor: ColorManager.primaryColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (code) {},
                  onChanged: (value) {},
                  controller: context.read<RegisterCubit>().otpController,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  const Text(
                    'If you didn’t receive a code!',
                    style: TextStyles.textStyle16,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend',
                      style: TextStyles.textStyle16.copyWith(
                          color: ColorManager.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              DefaultButton(
                text: S.of(context).verify,
                onPressed: () {
                  validateThenVerify(context);
                },
              ),
              const VerifyEmailListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenVerify(BuildContext context) {
    if (context
        .read<RegisterCubit>()
        .formKeyVerifyEmail
        .currentState!
        .validate()) {
      context
          .read<RegisterCubit>()
          .emitVerifyEmailStates(VerifyEmailRequestBody(
            email: email,
            activateCode: context.read<RegisterCubit>().otpController.text,
          ));
    }
  }
}
