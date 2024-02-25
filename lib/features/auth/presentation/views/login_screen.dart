import 'package:art_space_artist/core/components/default_button.dart';
import 'package:art_space_artist/core/components/default_text_field.dart';
import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:art_space_artist/features/auth/presentation/view_model/auth_cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
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
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) => () {},
                    builder:(context, state) {
                      final cubit = AuthCubit.get(context);
                      return Form(
                      key: _formKey,
                      child: Column(
                        children: [
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
                            obscureText: cubit.showPassword,
                            maxLines: 1,
                            icon: Icons.remove_red_eye_outlined,
                            onPressedIcon: () {
                              cubit.changeVisibilityPassword();
                            },
                          ),
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
                                Navigator.pushReplacementNamed(
                                  context, AppRouterNames.home,
                                );
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
                                  ))
                            ],
                          ),
                        ],
                      ),
                    );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
