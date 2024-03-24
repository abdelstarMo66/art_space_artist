import 'package:flutter/material.dart';

import '../../../../../core/constants/text_style.dart';

class CreateProductTextForm extends StatelessWidget {

  final String text;
  final double padding;
  final TextEditingController controller;
  final Widget? widget;
  final FormFieldValidator  validator;
  final int? maxLines;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  const CreateProductTextForm({super.key, required this.text, required this.controller, this.widget, required this.validator, this.maxLines, required this.keyboardType, required this.textAlign, required this.padding});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
          hintText: text,
          isDense: true,
          contentPadding:  EdgeInsets.all(padding),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          icon: widget,
      ),
      validator: validator,
      maxLines: maxLines,
    );
  }
}
