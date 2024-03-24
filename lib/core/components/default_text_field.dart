import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import '../constants/color_manager.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.keyboardType,
    required this.obscureText,
    required this.maxLines,
    this.icon,
    this.onPressedIcon,
  });
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLines;
  final IconData? icon;
  final VoidCallback? onPressedIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorManager.primaryColor,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.textFormBGColor,
        hintText: hintText,
        hintStyle: TextStyles.textStyle16.copyWith(color: Colors.grey),
        enabledBorder: customBorder(color: ColorManager.originalWhite),
        focusedBorder: customBorder(color: ColorManager.primaryColor),
        suffixIcon: IconButton(
          icon: Icon(icon, color: Colors.grey),
          onPressed: onPressedIcon,
        ),
      ),
    );
  }

  OutlineInputBorder customBorder({required Color color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: color, style: BorderStyle.solid),
      );
}
