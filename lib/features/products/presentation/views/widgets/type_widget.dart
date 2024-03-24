import 'package:flutter/material.dart';

import '../../../../../core/constants/color_manager.dart';
import '../../../../../core/constants/text_style.dart';

class TypeWidget extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final String text;
  const TypeWidget({Key? key, required this.items, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: TextStyles.textStyle18,),
        const Spacer(),
        DropdownButton(
          value: 0,
          dropdownColor: ColorManager.customGreyColor,
          iconEnabledColor: ColorManager.primaryColor,
          items: items,
          onChanged: (value) {

          },),
      ],
    );
  }
}
