import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constants/assets_manager.dart';
import '../../../../../../core/constants/color_manager.dart';
import '../../../../../../core/router/app_router_names.dart';

class EditProfileAppBar extends StatelessWidget {
  const EditProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRouterNames.home);
          },
          child: SvgPicture.asset(
            AssetsManager.icBackArrow,
            colorFilter: const ColorFilter.mode(
                ColorManager.originalWhite, BlendMode.srcIn),
            width: 38,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.24,
        ),
        const Text(
          'Edit Profile',
          style: TextStyle(
            color: ColorManager.originalWhite,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
