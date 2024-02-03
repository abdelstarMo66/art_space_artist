import 'package:art_space_artist/core/components/default_button.dart';
import 'package:art_space_artist/core/components/default_text_field.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'LOGO',
                    style: TextStyles.textStyle36,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    S.of(context).welcomeBack,
                    style: TextStyles.textStyle36,
                  ),
                  Text(S.of(context).loginMessage,
                      style: TextStyles.textStyle18),
                  const SizedBox(
                    height: 30,
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  DefaultTextField(
                    controller: passwordController,
                    hintText: S.of(context).password,
                    validator: (value) {
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    maxLines: 1,
                    icon: Icons.remove_red_eye_outlined,
                    onPressedIcon: () {},
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      child: Text(
                        S.of(context).forgetPassword,
                        style: TextStyles.textStyle12,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouterNames.forgetPassword);
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                  ),
                  DefaultButton(text: S.of(context).login, onPressed: () {}),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).newMember,
                        style: TextStyles.textStyle12
                            .copyWith(color: ColorManager.originalBlack),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRouterNames.register);
                          },
                          child: Text(
                            S.of(context).register,
                            style: TextStyles.textStyle12
                                .copyWith(fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
