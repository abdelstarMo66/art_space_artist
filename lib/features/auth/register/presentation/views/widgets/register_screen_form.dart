import 'package:art_space_artist/features/auth/register/presentation/view_model/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/components/default_text_field.dart';
import '../../../../../../core/helpers/validation_helper.dart';
import '../../../../../../generated/l10n.dart';
import 'custom_circle_avater.dart';

class RegisterScreenForm extends StatelessWidget {
  const RegisterScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<RegisterCubit>().formKey,
        child: Column(
          children: [
            Row(
              children: [
                const CustomRegisterCircleAvatar(),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: DefaultTextField(
                      controller: context.read<RegisterCubit>().nameController,
                      hintText: S.of(context).name,
                      validator: (value) {
                        if(value == null || value.isEmpty || !ExtString.isValidName(value))
                        {
                          return 'Please enter valid name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      maxLines: 1),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            DefaultTextField(
                controller: context.read<RegisterCubit>().emailAddressController,
                hintText: S.of(context).email,
                validator: (value) {
                  if(value == null || value.isEmpty || !ExtString.isValidEmail(value))
                  {
                    return 'Please enter valid email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                maxLines: 1),
            const SizedBox(
              height: 20.0,
            ),
            DefaultTextField(
              controller: context.read<RegisterCubit>().phoneController,
              hintText: S.of(context).phone,
              validator: (value) {
                if(value == null || value.isEmpty || !ExtString.isValidPhone(value))
                {
                  return 'Please enter valid phone';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              obscureText: false,
              maxLines: 1,
            ),
            const SizedBox(
              height: 20.0,
            ),
            DefaultTextField(
                icon: Icons.visibility,
                controller: context.read<RegisterCubit>().passwordController,
                hintText: S.of(context).password,
                validator: (value) {
                  if(value == null || value.isEmpty || !ExtString.isValidPassword(value))
                  {
                    return 'Please enter valid password ';
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                maxLines: 1),
            const SizedBox(
              height: 20.0,
            ),
            DefaultTextField(
                icon: Icons.visibility,
                controller:  context.read<RegisterCubit>().confirmPasswordController,
                hintText: S.of(context).confirmPassword,
                validator: (value) {
                  if(value == null || value.isEmpty || context.read<RegisterCubit>().confirmPasswordController == context.read<RegisterCubit>().passwordController)
                  {
                    return 'Please enter valid password';
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                maxLines: 1),
          ],
        )
    );
  }
}
