
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/features/events/data/model/get_event_details_response.dart';
import 'package:flutter/material.dart';

class ArtworkItem extends StatelessWidget {
  final Products product;

  const ArtworkItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(product.coverImage),
                  fit: BoxFit.cover,
                  width: 180.0,
                  height: 150.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 10.0),
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    color: ColorManager.darkGray.withOpacity(0.7),
                    borderRadius: const BorderRadiusDirectional.only(
                      topEnd: Radius.circular(8.0),
                      bottomEnd: Radius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    "\$ ${product.price}",
                    style: TextStyles.textStyle14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.textStyle20,
            ),
            const SizedBox(height: 2),
            Text(
              product.category,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.textStyle14.copyWith(
                color: ColorManager.darkGray
              ),
            ),
          ],
        ),
      ),
    );
  }
}