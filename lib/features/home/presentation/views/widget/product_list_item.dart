import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProductViewWidget extends StatelessWidget {
  const CustomProductViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.21,
          padding: const EdgeInsetsDirectional.all(10.0),
          decoration: BoxDecoration(
            color: ColorManager.customGreyColor,
            borderRadius: BorderRadiusDirectional.circular(30),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'Product Name',
                    style: TextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        '2,000',
                        style: TextStyles.textStyle14Primary.copyWith(fontWeight: FontWeight.bold),),
                      SvgPicture.asset(AssetsManager.icMoney,

                        color: ColorManager.primaryColor,
                      ),
                      const Spacer(),
                      Text(
                        '450',
                        style: TextStyles.textStyle12.copyWith(
                            color: ColorManager.originalBlack),
                      ),
                      SvgPicture.asset(
                        AssetsManager.icViews,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Card(
                margin: const EdgeInsets.all(12.0),
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
                ) ,
                shadowColor: ColorManager.primaryColor,
                elevation: 10.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset('assets/images/33028820_7947575.jpg')),
              ),
            ),
          ],
        )
      ],
    );
  }
}
