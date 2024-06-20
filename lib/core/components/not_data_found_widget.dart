import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/assets_manager.dart';
import '../constants/text_style.dart';

class NotDataFoundWidget extends StatelessWidget {
  final String text;
  const NotDataFoundWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsManager.imgDataEmpty,
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            const SizedBox(
              height: 20.0,
            ),
             Text(
              text,
              style: TextStyles.textStyle18,
            ),
          ],
        ),
      ),
    );
  }
}
