import 'package:flutter/material.dart';

import '../../../../../core/constants/color_manager.dart';
import '../../../../../core/constants/text_style.dart';

class TypeWidget extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final String text;
  final ValueChanged onChanged;
  final int value;

  const TypeWidget({
    super.key,
    required this.items,
    required this.text,
    required this.onChanged,
    required this.value,
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
      trailing: DropdownButton(
        value: value,
        dropdownColor: ColorManager.lighterGray,
        elevation: 0,
        iconEnabledColor: ColorManager.primaryColor,
        items: items,
        onChanged: onChanged,
        borderRadius: BorderRadius.circular(8.0),
        underline: const SizedBox.shrink(),
        alignment: Alignment.center,
      ),
    );
  }
}
