import 'package:art_space_artist/core/components/default_button.dart';
import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/auth/register/data/models/register_request_body.dart';
import 'package:art_space_artist/features/auth/register/presentation/view_model/register_cubit.dart';
import 'package:art_space_artist/features/auth/register/presentation/views/widgets/register_listener.dart';
import 'package:art_space_artist/features/auth/register/presentation/views/widgets/register_screen_form.dart';
import 'package:art_space_artist/features/auth/register/presentation/views/widgets/select_gender_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
bool isMale = true;
bool securePassword = true;
class _RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.originalWhite,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).register,
                style: TextStyles.textStyle36,
              ),
              const SizedBox(
                height: 30.0,
              ),
              const RegisterScreenForm(),
              const SizedBox(height: 20.0,),
              Row(
                children: [
                  const Text('Gender', style:  TextStyles.textStyle30,),
                  const Spacer(),
                  SelectGenderWidget(
                      icon: AssetsManager.icMale,
                      iconColor: isMale == true ? ColorManager.originalWhite : ColorManager.originalBlack,
                      backgroundColor:isMale == true ? ColorManager.primaryColor : ColorManager.thirdColor,
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  ),
                  const SizedBox(width: 25,),
                  SelectGenderWidget(
                    icon: AssetsManager.icFemale,
                    iconColor: isMale == false ? ColorManager.originalWhite : ColorManager.originalBlack,
                    backgroundColor: isMale == false ? ColorManager.primaryColor : ColorManager.thirdColor,
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              DefaultButton(
                  text: S.of(context).register,
                  onPressed: () {
                    validateThenRegister(context);
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(S.of(context).alreadyHaveAnAccount, style: TextStyles.textStyle16.copyWith(fontSize: 14),),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AppRouterNames.login,
                        );
                      },
                      child: Text(
                        S.of(context).login,
                        style: TextStyles.textStyle12
                            .copyWith(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              const RegisterListener(),
            ],
          ),
        ),
      )),
    );
  }

  void validateThenRegister(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitRegisterStates(RegisterRequestBody(
        gender: isMale == true ? 'male' : 'female',
            name: context.read<RegisterCubit>().nameController.text,
            email: context.read<RegisterCubit>().emailAddressController.text,
            password: context.read<RegisterCubit>().passwordController.text,
            passwordConfirm:
                context.read<RegisterCubit>().confirmPasswordController.text,
            phone: context.read<RegisterCubit>().phoneController.text,
            profileImg: '',
          ));
    }
  }
}
