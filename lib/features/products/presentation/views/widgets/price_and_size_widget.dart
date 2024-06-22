import 'package:flutter/material.dart';

import '../../../../../core/components/create_text_form.dart';
import '../../../../../core/constants/text_style.dart';

class PriceAndSizeWidget extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final String hintText;
  const PriceAndSizeWidget({
    super.key,
    required this.controller,
    required this.text, required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyles.textStyle18,
      ),
      contentPadding: EdgeInsets.zero,
      dense: true,
      trailing: SizedBox(
        width: 70.0,
        child: CreateTextForm(
          padding: 4,
          textAlign: TextAlign.center,
          text: hintText,
          maxLength: 5,
          counterWidget: const Offstage(),
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
