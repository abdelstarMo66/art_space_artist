import 'package:art_space_artist/core/components/default_button.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/auth/register/data/models/register_request_body.dart';
import 'package:art_space_artist/features/auth/register/presentation/view_model/register_cubit.dart';
import 'package:art_space_artist/features/auth/register/presentation/views/widgets/register_listener.dart';
import 'package:art_space_artist/features/auth/register/presentation/views/widgets/register_screen_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                AppRouterNames.login,
              );
            }),
      ),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.12),
              DefaultButton(
                  text: S.of(context).register,
                  onPressed: () {
                    validateThenRegister(context);
                  }),
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
