import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/color_manager.dart';
import '../../../../../core/constants/text_style.dart';

class CustomInfoRow extends StatelessWidget {
  const CustomInfoRow({super.key, required this.text, required this.icon});
final String icon;
final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, height: MediaQuery.of(context).size.height * 0.045),
        Expanded(
          child: Text(
            text,
            style: TextStyles.textStyle14.copyWith(color: ColorManager.originalBlack),
          ),
        ),
      ],
    );
  }
}
