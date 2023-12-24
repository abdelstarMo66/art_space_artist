import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/global_bloc/app_cubit/app_cubit.dart';
import 'package:art_space_artist/core/router/app_router.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/onboarding/presentation/views/widgets/onBoarding_UI.dart';
import 'package:art_space_artist/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController boardController = PageController();
    List<OnBoardingScreenUi> onBoardingModels = [
      OnBoardingScreenUi(
          image: 'assets/images/Art lover-bro (1) 1.png',
          mainText: S.of(context).onBoardingFirstScreenMain,
          secondText: S.of(context).onBoardingFirstScreenSecond),
      OnBoardingScreenUi(
          image: 'assets/images/Images-cuate 1.png',
          mainText: S.of(context).onBoardingSecScreenMain,
          secondText: S.of(context).onBoardingSecScreenSecond),
      OnBoardingScreenUi(
          image: 'assets/images/Online gallery-pana 1.png',
          mainText: S.of(context).onBoardingThirdScreenMain,
          secondText: S.of(context).onBoardingThirdScreenSecond),
    ];
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
                if (value == onBoardingModels.length - 1) {
                  cubit.lastScreenOnBoarding = true;
                } else {
                  cubit.lastScreenOnBoarding = false;
                }
              },
              itemBuilder: (context, index) => onBoardingModels[index],
              itemCount: onBoardingModels.length,
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
                  count: onBoardingModels.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    spacing: 6.0,
                    expansionFactor: 5,
                    activeDotColor: ColorManager.primaryColor,
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
          )
        ],
      ),
    );
  }
}
