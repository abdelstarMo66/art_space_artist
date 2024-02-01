import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/global_bloc/app_cubit/app_cubit.dart';
import 'package:art_space_artist/core/router/app_router.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/onboarding/data/models/on_boarding_screen_ui_model.dart';
import 'package:art_space_artist/features/onboarding/presentation/views/widgets/onboarding_ui_widget.dart';
import 'package:art_space_artist/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constants/assets_manager.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<OnBoardingScreenUiModel> onBoardingData = [
      OnBoardingScreenUiModel(
        image: AssetsManager.imgOnBoardingScreen2,
        title: S.of(context).onBoardingFirstScreenMain,
        subTitle: S.of(context).onBoardingFirstScreenSecond,),
      OnBoardingScreenUiModel(
        image: AssetsManager.imgOnBoardingScreen1,
        title: S.of(context).onBoardingSecScreenMain,
        subTitle: S.of(context).onBoardingSecScreenSecond,),
      OnBoardingScreenUiModel(
        image: AssetsManager.imgOnBoardingScreen3,
        title: S.of(context).onBoardingThirdScreenMain,
        subTitle:S.of(context).onBoardingThirdScreenSecond,)
    ];
    PageController boardController = PageController();
    AppCubit cubit = AppCubit.get(context);
    return Scaffold(
      backgroundColor: ColorManager.originalWhite,
      appBar: AppBar(
        backgroundColor: ColorManager.originalWhite,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: ColorManager.originalWhite),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRouterNames.login);
              },
              child: Text(
                S.of(context).onBoardingAppBarTitle,
                style: TextStyles.textStyle21,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) {
                if (value == onBoardingData.length - 1) {
                  cubit.lastScreenOnBoarding = true;
                } else {
                  cubit.lastScreenOnBoarding = false;
                }
              },
              itemBuilder: (context, index) => OnBoardingScreenUi(onBoardingScreenUiModel: onBoardingData[index]),
              itemCount: onBoardingData.length,
              controller: boardController,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: onBoardingData.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: ColorManager.primaryColor,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    spacing: 6.0,
                    expansionFactor: 5,
                    activeDotColor: ColorManager.originalBlack,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (cubit.lastScreenOnBoarding == true) {
                      Navigator.pushReplacementNamed(
                          context, AppRouterNames.login);
                    } else {
                      boardController.nextPage(
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.ease,
                      );
                    }
                  },
                  backgroundColor: ColorManager.primaryColor,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: ColorManager.originalWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
