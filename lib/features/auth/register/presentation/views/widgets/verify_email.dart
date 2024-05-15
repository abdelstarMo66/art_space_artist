import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/di/dependency_injection.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/view_model/forget_password_cubit.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/views/widgets/custom_stack_widget.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/views/widgets/verify_email_listener.dart';
import 'package:art_space_artist/features/auth/register/presentation/view_model/register_cubit.dart';
import 'package:art_space_artist/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../../core/components/default_button.dart';
import '../../../../../../core/constants/text_style.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.primaryColor,
          leading:IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset(AssetsManager.icBackArrow, height: 40,),
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
                      if(value == null || value.isEmpty)
                      {
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
                      activeFillColor: ColorManager
                          .originalWhite, // اللون الي جوا لما يبقا متحدد
                      inactiveFillColor: ColorManager
                          .originalWhite, // اللون الي جوا لما يبقا مش متحدد
                      activeColor: ColorManager.primaryColor, // لون البوردرالمتحدده
                      inactiveColor:
                      ColorManager.thirdColor, // لون البوردر الي مش متحدده
                      selectedFillColor:
                      ColorManager.originalWhite, // اللون الي انا واقف عليه
                      selectedColor: ColorManager.primaryColor,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (code) {},
                    onChanged: (value) {},
                    controller: context.read<ForgetPasswordCubit>().otpController,
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
                        )),
                  ],
                ),
                DefaultButton(
                    text: S.of(context).verify,
                    onPressed: () {},
                ),
                const VerifyEmailListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
