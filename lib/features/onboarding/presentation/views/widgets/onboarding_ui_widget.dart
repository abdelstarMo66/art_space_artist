import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/text_style.dart';
import '../../../data/models/on_boarding_screen_ui_model.dart';

class OnBoardingScreenUi extends StatelessWidget {
  final OnBoardingScreenUiModel onBoardingScreenUiModel;
  const OnBoardingScreenUi({super.key, required this.onBoardingScreenUiModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SvgPicture.asset(
                onBoardingScreenUiModel.image,
                height: MediaQuery.of(context).size.height * 0.4),
          ),
          const Spacer(),
          Text(
            onBoardingScreenUiModel.title,
            style: TextStyles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            onBoardingScreenUiModel.subTitle,
            style: TextStyles.textStyle20,
          ),
        ],
      ),
    );
  }
}
