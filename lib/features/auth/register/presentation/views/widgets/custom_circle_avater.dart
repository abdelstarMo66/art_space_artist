import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/constants/assets_manager.dart';


class CustomRegisterCircleAvatar extends StatelessWidget {
  const CustomRegisterCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300],
          child: SvgPicture.asset(AssetsManager.registerAvatar),
        ),
        InkWell(
          onTap: () {},
          child: const CircleAvatar(
            radius: 11.5,
            backgroundColor: ColorManager.originalWhite,
            child: CircleAvatar(
              radius: 10.0,
              backgroundColor: ColorManager.primaryColor,
              child: Icon(
                Icons.add,
                color: ColorManager.originalWhite,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
