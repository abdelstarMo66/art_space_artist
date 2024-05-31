import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class CreateTextForm extends StatelessWidget {
  final String text;
  final double padding;
  final TextEditingController controller;
  final Widget? widget;
  final Widget? counterWidget;
  final FormFieldValidator validator;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final TextInputType ?textInputType;
  final GestureTapCallback? onTap;
  const CreateTextForm({
    super.key,
    required this.text,
    this.textInputType,
    required this.controller,
    this.widget,
    this.counterWidget,
    required this.validator,
    this.maxLines,
    this.minLines,
    this.maxLength,
    required this.keyboardType,
    required this.textAlign,
    required this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      textAlign: textAlign,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyles.textStyle16,
        isDense: true,
        contentPadding: EdgeInsets.all(padding),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: ColorManager.darkGray,
            width: 0.6,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: ColorManager.primaryColor,
            width: 0.6,
          ),
        ),
        icon: widget,
        counter: counterWidget,
      ),
      maxLength: maxLength,
      validator: validator,
      maxLines: maxLines,
      minLines: minLines,
    );
  }
}
