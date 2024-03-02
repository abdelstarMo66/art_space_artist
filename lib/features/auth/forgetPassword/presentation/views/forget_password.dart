import 'package:art_space_artist/core/components/default_button.dart';
import 'package:art_space_artist/core/components/default_text_field.dart';
import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/views/widgets/custom_stack_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
      ),
      backgroundColor: ColorManager.thirdColor,
      body: CustomStackWidget(
        image: AssetsManager.imgForgetPassword,
        widget: SingleChildScrollView(
          child: Column(
          children: [
            Text(S.of(context).forgetPassword,
              style: TextStyles.textStyle30.copyWith(fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 10,
            ),
             Text(S.of(context).forgetPasswordText, style: TextStyles.textStyle18,),
            const SizedBox(
              height: 30.0,
            ),
            DefaultTextField(
                controller: emailController,
                hintText: S.of(context).email,
                validator: (value) {
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                maxLines: 1),
            const SizedBox(height: 60.0),
            DefaultButton(text: S.of(context).send,
                onPressed: () {
              Navigator.pushNamed(context, AppRouterNames.verifyEmail);
                }),
          ],
                ),
        ),),
    );
  }
}
