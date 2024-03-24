import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectGenderWidget extends StatelessWidget {

  final String icon;
  final Color iconColor;
  final Color backgroundColor;
  final GestureTapCallback onTap;
  const SelectGenderWidget({super.key, required this.icon, required this.iconColor, required this.backgroundColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
        color:backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            icon,
            colorFilter:  ColorFilter.mode(iconColor, BlendMode.srcIn),
            height: 40,),
        ),
      ),
    );
  }
}
