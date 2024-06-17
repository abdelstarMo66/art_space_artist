import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/features/products/data/models/get_product_details_response.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductImagesView extends StatefulWidget {
  final String coverImage;
  final List<CoverImage> images;

  const ProductImagesView(
      {super.key, required this.coverImage, required this.images});

  @override
  State<ProductImagesView> createState() => _ProductImagesViewState();
}

class _ProductImagesViewState extends State<ProductImagesView> {
  final List<String> images = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    images.add(widget.coverImage);
    for (int i = 0; i < widget.images.length; i++) {
      images.add(widget.images[i].image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < images.length; i++) ...[
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.elasticInOut,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 3.0),
                    height: i == _currentIndex ? 30.0 : 12.0,
                    width: 6.0,
                    decoration: BoxDecoration(
                      color: i == _currentIndex
                          ? ColorManager.originalBlack
                          : ColorManager.lighterGray.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                        color: i == _currentIndex
                            ? ColorManager.originalWhite
                            : ColorManager.darkGray,
                        width: 0.4,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        Expanded(
          child: CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                ClipRRect(
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(12.0),
                bottomStart: Radius.circular(12.0),
              ),
              child: Image.network(
                images[index],
                fit: BoxFit.fill,
                height: 150,
              ),
            ),
            options: CarouselOptions(
              viewportFraction: 0.96,
              initialPage: 0,
              autoPlayCurve: Curves.elasticInOut,
              scrollPhysics: const BouncingScrollPhysics(),
              height: MediaQuery.of(context).size.height * 0.24,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              enlargeFactor: 0.8,
              scrollDirection: Axis.vertical,
              onPageChanged: (index, page) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
