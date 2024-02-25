import 'package:flutter/material.dart';
import '../../../../../core/constants/color_manager.dart';
import '../../../../../core/constants/text_style.dart';

class FilterProductWidget extends StatelessWidget {
  const FilterProductWidget({
    super.key,
    required this.text,
    required this.onTap,
    required this.textStyles,
    required this.color
  });
  final String text;
  final GestureTapCallback onTap;
  final TextStyle textStyles;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80.0,
        decoration: BoxDecoration(
          color:color,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: ColorManager.primaryColor)
        ),
        padding: const EdgeInsetsDirectional.all(
            5.0
        ),
        child: Center(
            child: Text(
              text,
              style: textStyles,
            )
        ),
      ),
    );
  }
}
