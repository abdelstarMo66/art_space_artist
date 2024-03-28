import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ViewProductDetails extends StatelessWidget {
  const ViewProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    AssetsManager.icBackArrow,
                    height: 40.0,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SvgPicture.asset(
                    AssetsManager.icEdit,
                    height: 40.0,
                    colorFilter: const ColorFilter.mode(
                        ColorManager.primaryColor, BlendMode.srcIn),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SvgPicture.asset(
                    AssetsManager.icTrash,
                    height: 40.0,
                    colorFilter:
                        const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Text(
                    'Product Name',
                    style: TextStyles.textStyle30
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'description description description description description description',
                    style: TextStyles.textStyle18,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Specifications',
                    style: TextStyles.textStyle24.copyWith(
                      color: ColorManager.originalBlack,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Height : 130',
                            style: TextStyles.textStyle18,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Width : 130',
                            style: TextStyles.textStyle18,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Depth : 130',
                            style: TextStyles.textStyle18,
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Column(
                          children: [
                            Text(
                              'category : Wood',
                              style: TextStyles.textStyle18,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'material : paper',
                              style: TextStyles.textStyle18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.42,
              child: Card(
                margin: const EdgeInsets.only(left: 1),
                elevation: 10.0,
                shadowColor: ColorManager.originalBlack,
                color: ColorManager.primaryColor,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(100))),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const AnimatedSmoothIndicator(
                              activeIndex: 0,
                              count: 3,
                          axisDirection: Axis.vertical,
                            effect: ExpandingDotsEffect(
                              activeDotColor: ColorManager.originalBlack,
                              dotColor: ColorManager.originalWhite,
                              dotHeight: 5,
                              dotWidth: 20,
                              spacing: 15,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadiusDirectional.circular(25),
                            child: Image.asset(
                              'assets/images/33028820_7947575.jpg',
                              height: MediaQuery.of(context).size.height * 0.24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '\$2250',
                        style: TextStyles.textStyle26
                            .copyWith(color: ColorManager.originalWhite),
                      ),Text(
                        'price',
                        style: TextStyles.textStyle12
                            .copyWith(color: ColorManager.originalWhite),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
