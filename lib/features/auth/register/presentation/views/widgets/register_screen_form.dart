import 'dart:io';

import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/constants/toast_color.dart';
import 'package:art_space_artist/features/auth/register/presentation/view_model/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/components/default_text_field.dart';
import '../../../../../../core/helpers/validation_helper.dart';
import '../../../../../../generated/l10n.dart';
import 'custom_circle_avater.dart';

class RegisterScreenForm extends StatefulWidget {
  const RegisterScreenForm({super.key});

  @override
  State<RegisterScreenForm> createState() => _RegisterScreenFormState();
}

class _RegisterScreenFormState extends State<RegisterScreenForm> {
  bool isScurePassword = true;
  File ? image;

  Future pickImage() async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imgTemp = File(image.path);
      setState(() => this.image = imgTemp);
    } on PlatformException catch(e) {
      showToast(msg: '$e',
          state: ToastState.warning);
    }
  }
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
                        if (value == null ||
                            value.isEmpty ||
                            value.hashCode <= 3) {
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
                controller:
                    context.read<RegisterCubit>().emailAddressController,
                hintText: S.of(context).email,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !ExtString.isValidEmail(value)) {
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
                if (value == null ||
                    value.isEmpty ||
                    !ExtString.isValidPhone(value)) {
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
                icon:isScurePassword ? Icons.visibility : Icons.visibility_off,
                controller: context.read<RegisterCubit>().passwordController,
                hintText: S.of(context).password,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      ExtString.isValidPassword(value)) {
                    return 'Please enter valid password ';
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: isScurePassword,
                maxLines: 1,
              onPressedIcon: () {
                setState(() {
                  isScurePassword = ! isScurePassword;
                });
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            DefaultTextField(
              onPressedIcon: () {
                setState(() {
                  isScurePassword = ! isScurePassword;
                });
              },
                icon: isScurePassword ? Icons.visibility : Icons.visibility_off,
                controller:
                    context.read<RegisterCubit>().confirmPasswordController,
                hintText: S.of(context).confirmPassword,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      context.read<RegisterCubit>().confirmPasswordController ==
                          context.read<RegisterCubit>().passwordController) {
                    return 'Please enter same password';
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: isScurePassword,
                maxLines: 1),
          ],
        ));
  }
}
