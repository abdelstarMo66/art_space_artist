import 'package:art_space_artist/core/components/default_button.dart';
import 'package:art_space_artist/core/components/default_text_field.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/features/auth/presentation/views/widgets/custom_circle_avater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/assets_manager.dart';
import '../../../../generated/l10n.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var passwordController = TextEditingController();
    var emailAddressController = TextEditingController();
    var phoneController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('LOGO'), centerTitle: true, backgroundColor: Colors.white,),
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
              Row(
                children: [
                  const CustomRegisterCircleAvatar(),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: DefaultTextField(
                        controller: nameController,
                        hintText: S.of(context).name,
                        validator: (value) {
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
                  controller: emailAddressController,
                  hintText: S.of(context).email,
                  validator: (value) {},
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  maxLines: 1),
              const SizedBox(
                height: 20.0,
              ),
              DefaultTextField(
                  controller: phoneController,
                  hintText: S.of(context).phone,
                  validator: (value) {},
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  maxLines: 1),
              const SizedBox(
                height: 20.0,
              ),
              DefaultTextField(
                  icon: Icons.visibility,
                  controller: passwordController,
                  hintText: S.of(context).password,
                  validator: (value) {},
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  maxLines: 1),
              const SizedBox(
                height: 20.0,
              ),
              DefaultTextField(
                  icon: Icons.visibility,
                  controller: confirmPasswordController,
                  hintText: S.of(context).confirmPassword,
                  validator: (value) {},
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  maxLines: 1),
               SizedBox(
                height: MediaQuery.of(context).size.height * 0.12
              ),
              DefaultButton(text: S.of(context).register, onPressed: () {}),
            ],
          ),
        ),
      )),
    );
  }
}
