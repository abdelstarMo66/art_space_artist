import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/features/auth/presentation/views/widgets/custom_otp_widgets.dart';
import 'package:art_space_artist/features/auth/presentation/views/widgets/custom_stack_widget.dart';
import 'package:art_space_artist/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/components/default_button.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/router/app_router_names.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
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
              const SizedBox(height: 60.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomOTPWidget(),
                  CustomOTPWidget(),
                  CustomOTPWidget(),
                  CustomOTPWidget(),
                  CustomOTPWidget(),
                  CustomOTPWidget(),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  const Text(
                    'If you didn’t recieve a code!',
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
                  onPressed: () {
                    Navigator.pushNamed(
                        context, AppRouterNames.createNewPassword);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
