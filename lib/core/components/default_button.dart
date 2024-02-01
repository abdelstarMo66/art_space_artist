import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/generated/l10n.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  String text ;
  final VoidCallback? onPressed;
   DefaultButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      onPressed: () {},
      color: ColorManager.secondaryColor,
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
          const Icon(Icons.arrow_forward_ios,
              color: ColorManager.originalWhite),
        ],
      ),
    );
  }
}
