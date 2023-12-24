import 'package:flutter/material.dart';
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(onBoardingScreenUiModel.image,
              height: MediaQuery.of(context).size.height * 0.35),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            onBoardingScreenUiModel.mainText,
            style: TextStyles.textStyle24,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 35,
          ),
          Text(
            onBoardingScreenUiModel.secondText,
            style: TextStyles.textStyle20,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
