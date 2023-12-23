import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/constants/text_style.dart';

class OnBoardingScreenUi extends StatelessWidget {
  final String image;
  final String mainText;
  final String secondText;
  OnBoardingScreenUi({Key? key, required this.image, required this.mainText, required this.secondText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
                image,
                height: MediaQuery.of(context).size.height * 0.35),
            const SizedBox(
              height: 20.0,
            ),
            Text(
             mainText,
              style: TextStyles.textStyle24,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              secondText,
              style: TextStyles.textStyle20,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
  }
}
