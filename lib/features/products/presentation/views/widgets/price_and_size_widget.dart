import 'package:flutter/material.dart';

import '../../../../../core/constants/text_style.dart';
import 'create_product_text_form.dart';

class PriceAndSizeWidget extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final Widget widget;

  const PriceAndSizeWidget(
      {super.key,
      required this.controller,
      required this.text,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyles.textStyle18,
        ),
        const Spacer(),
        SizedBox(
          height: 30,
          width: 70,
          child: CreateProductTextForm(
            padding: 5,
            textAlign: TextAlign.center,
            text: '0',
            controller: controller,
            validator: (value) {},
            keyboardType: TextInputType.number,
          ),
        ),
        widget,
      ],
    );
  }
}
