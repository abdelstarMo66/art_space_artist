import 'package:art_space_artist/core/components/default_button.dart';
import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/auth/login/data/model/login_request_body.dart';
import 'package:art_space_artist/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:art_space_artist/features/auth/login/presentation/views/widgets/login_listener.dart';
import 'package:art_space_artist/features/auth/login/presentation/views/widgets/login_screen_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               SizedBox(
                   height: MediaQuery.of(context).size.height * 0.14,
                   child: SvgPicture.asset(AssetsManager.imgLogoAp)),
                const SizedBox(height: 15.0,),
                Text(
                  S.of(context).welcomeBack,
                  style: TextStyles.textStyle36,
                ),
                Text(S.of(context).loginMessage,
                    style: TextStyles.textStyle18),
                const SizedBox(
                  height: 30,
                ),
                     Column(
                      children: [
                        const LoginForm(),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: TextButton(
                            child: Text(
                              S.of(context).forgetPassword,
                              style: TextStyles.textStyle12,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRouterNames.forgetPassword);
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.23,
                        ),
                        DefaultButton(
                            text: S.of(context).login,
                            onPressed: () {
                              validateThenLogin(context);
                            }),
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
                                  Navigator.pushReplacementNamed(
                                      context, AppRouterNames.register);
                                },
                                child: Text(
                                  S.of(context).register,
                                  style: TextStyles.textStyle12
                                      .copyWith(fontWeight: FontWeight.bold),
                                )),
                            const LoginListener(),
                          ],
                        ),
                      ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void validateThenLogin(BuildContext context){
    if(context.read<LoginCubit>().formKey.currentState!.validate())
      {
        context.read<LoginCubit>().emitLoginStates(
            LoginRequestBody(
            email: context.read<LoginCubit>().emailController.text,
            password: context.read<LoginCubit>().passwordController.text));
      }
  }
}
