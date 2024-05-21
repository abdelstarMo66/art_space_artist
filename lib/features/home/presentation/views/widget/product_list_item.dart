import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/home/data/models/get_my_products_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProductViewWidget extends StatelessWidget {
  final ProductsInfo productInfo;

  const CustomProductViewWidget({super.key, required this.productInfo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310.0,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRouterNames.viewProductDetails,
              arguments: productInfo.id);
        },
        child: Stack(
          children: [
            Container(
              height: 120.0,
              padding: const EdgeInsetsDirectional.all(10.0),
              decoration: BoxDecoration(
                color: ColorManager.lighterGray,
                borderRadius: BorderRadiusDirectional.circular(30),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        productInfo.title,
                        style: TextStyles.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Text(
                            '${productInfo.price}',
                            style: TextStyles.textStyle14Primary
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SvgPicture.asset(
                            AssetsManager.icMoney,
                            colorFilter: const ColorFilter.mode(
                                ColorManager.primaryColor, BlendMode.srcIn),
                          ),
                          const Spacer(),
                          Text(
                            productInfo.category,
                            style: TextStyles.textStyle12
                                .copyWith(color: ColorManager.originalBlack),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(12.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  shadowColor: ColorManager.primaryColor,
                  elevation: 10.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.network(
                      '${productInfo.coverImage.image}',
                      height: 80.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
