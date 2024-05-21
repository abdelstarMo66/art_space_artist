import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/features/products/data/models/get_product_details_response.dart';
import 'package:flutter/material.dart';

class ProductInformation extends StatelessWidget {
  final ProductDetails productInfo;

  const ProductInformation({super.key, required this.productInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productInfo.title,
          style: TextStyles.textStyle26.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          productInfo.description,
          style: TextStyles.textStyle16,
        ),
        const SizedBox(height: 8),
        Text(
          'Specifications',
          style: TextStyles.textStyle24.copyWith(
            color: ColorManager.originalBlack,
          ),
        ),
        const SizedBox(height: 6.0),
        Wrap(
          spacing: 100.0,
          runSpacing: 6,
          children: [
            Text(
              'Height : ${productInfo.height}',
              style: TextStyles.textStyle18,
            ),
            Text(
              'Width : ${productInfo.width}',
              style: TextStyles.textStyle18,
            ),
            Text(
              'Depth : ${productInfo.depth}',
              style: TextStyles.textStyle18,
            ),
            Text(
              'category : ${productInfo.category}',
              style: TextStyles.textStyle18,
            ),
            Text(
              'material : ${productInfo.material}',
              style: TextStyles.textStyle18,
            ),
          ],
        ),
      ],
    );
  }
}
