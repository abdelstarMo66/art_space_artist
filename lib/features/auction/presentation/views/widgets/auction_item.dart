import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/assets_manager.dart';
import '../../../../../core/constants/color_manager.dart';
import '../../../../../core/constants/text_style.dart';
import '../../view_model/auction_cubit.dart';

class AuctionItem extends StatelessWidget {
  final int index;
  const AuctionItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    AuctionCubit cubit = context.read<AuctionCubit>();
    return Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(8),
        color: ColorManager.lighterGray,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              child: Image.network(
                '${cubit.myAuctions[index].coverImage.image}',
                fit: BoxFit.fill,
                height: 120,
                width: 120,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cubit.myAuctions[index].title,
                      style: TextStyles.textStyle18.copyWith(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      cubit.myAuctions[index].description,
                      maxLines: 2,
                      style: TextStyles.textStyle14
                          .copyWith(color: ColorManager.gray),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AssetsManager.icTime,
                          colorFilter: const ColorFilter.mode(
                              ColorManager.primaryColor,
                              BlendMode.srcIn),
                        ),
                        Text('${cubit.myAuctions[index].duration}', style: TextStyles.textStyle16,),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            '💰${cubit.myAuctions[index].price}',
                            style: TextStyles.textStyle18.copyWith(
                                color: ColorManager.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ));
  }
}
