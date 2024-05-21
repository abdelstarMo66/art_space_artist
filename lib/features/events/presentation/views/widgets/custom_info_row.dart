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
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      horizontalTitleGap: 4.0,
      leading: SvgPicture.asset(icon, height: 24.0, colorFilter: const ColorFilter.mode(ColorManager.primaryColor, BlendMode.srcIn),),
      title: Text(
        text,
        style: TextStyles.textStyle14.copyWith(color: ColorManager.originalBlack),
      ),
    );
  }
}
