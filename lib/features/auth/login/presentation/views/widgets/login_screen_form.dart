import 'package:art_space_artist/core/helpers/validation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/components/default_text_field.dart';
import '../../../../../../generated/l10n.dart';
import '../../view_model/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isScurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          DefaultTextField(
              controller: context.read<LoginCubit>().emailController,
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
            icon:isScurePassword ? Icons.visibility : Icons.visibility_off,
            controller:  context.read<LoginCubit>().passwordController,
            hintText: S.of(context).password,
            validator: (value) {
              if(value == null || value.isEmpty)
              {
                return 'Please enter valid password';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            obscureText: isScurePassword,
            maxLines: 1,
            onPressedIcon: () {
              setState(() {
                isScurePassword = ! isScurePassword;
              });
            },
          ),
        ],
      ),

    );
  }
}
