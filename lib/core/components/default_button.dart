import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text ;
  final VoidCallback? onPressed;
   const DefaultButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      onPressed: onPressed,
      color: ColorManager.primaryColor,
      height: MediaQuery.of(context).size.height * 0.06,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyles.textStyle24
                .copyWith(color: ColorManager.originalWhite),
          ),
        ],
      ),
    );
  }
}
