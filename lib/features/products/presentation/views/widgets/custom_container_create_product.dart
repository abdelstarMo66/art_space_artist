import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:flutter/material.dart';

class CustomContainerForCreateProduct extends StatelessWidget {
  final Widget widget;

  const CustomContainerForCreateProduct({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(18),
        border: Border.all(
          width: 0.6,
          color: ColorManager.darkGray,
        ),
      ),
      child: widget,
    );
  }
}
