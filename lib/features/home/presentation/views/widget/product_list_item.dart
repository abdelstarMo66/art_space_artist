import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProductViewWidget extends StatelessWidget {
  final int index;
  const CustomProductViewWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var productInfo = context.read<GetMyProductsCubit>().myProducts![index];
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
                    '${productInfo.title}',
                    style: TextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5.0,),
                  Row(
                    children: [
                      Text(
                        '${productInfo.price}',
                        style: TextStyles.textStyle14Primary.copyWith(fontWeight: FontWeight.bold),),
                      SvgPicture.asset(AssetsManager.icMoney,

                        color: ColorManager.primaryColor,
                      ),
                      const Spacer(),
                      Text(
                        '${productInfo.category}',
                        style: TextStyles.textStyle12.copyWith(
                            color: ColorManager.originalBlack),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.all(12.0),
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)
              ) ,
              shadowColor: ColorManager.primaryColor,
              elevation: 10.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                  child: Image.network('${productInfo.coverImage!.profileImg}')),
            ),
          ],
        )
      ],
    );
  }
}
