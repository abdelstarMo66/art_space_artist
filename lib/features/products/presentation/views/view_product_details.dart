import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/di/dependency_injection.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/products/data/models/get_product_details_response.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_cubit.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ViewProductDetails extends StatelessWidget {
  final String productId;

  const ViewProductDetails({required this.productId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            getIt<ProductsCubit>()..emitGetProductDetails(productId: productId),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is GetProductDetailsLoading) {
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: ColorManager.primaryColor, size: 100),
              );
            } else if (state is GetProductDetailsSuccess) {
              var productInfo = context.read<ProductsCubit>().productDetails;
              return Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.only(start: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: SvgPicture.asset(
                                  AssetsManager.icBackArrow,
                                  height: 40.0,
                                ),
                                onTap: () => Navigator.of(context).pop(),
                              ),
                              const SizedBox(height: 15.0),
                              SvgPicture.asset(
                                AssetsManager.icEdit,
                                height: 40.0,
                                colorFilter: const ColorFilter.mode(
                                    ColorManager.primaryColor, BlendMode.srcIn),
                              ),
                              const SizedBox(height: 15.0),
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<ProductsCubit>()
                                      .emitDeleteProduct(productId: productId);
                                  if (state is DeleteProductSuccess) {
                                    Navigator.pushReplacementNamed(
                                        context, AppRouterNames.home);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Deleting...',
                                          style: TextStyle(
                                            color: ColorManager.primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: SvgPicture.asset(
                                  AssetsManager.icTrash,
                                  height: 40.0,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.red, BlendMode.srcIn),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.14,
                              ),
                              Text(
                                productInfo!.title,
                                style: TextStyles.textStyle26
                                    .copyWith(fontWeight: FontWeight.bold),
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
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        ListTile(
                          tileColor: ColorManager.lighterGray,
                          dense: true,
                          horizontalTitleGap: 2,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 12.0),
                          leading: SvgPicture.asset(
                            productInfo.isAvailable
                                ? AssetsManager.icAvailable
                                : AssetsManager.icUnavailable,
                            width: 20.0,
                          ),
                          title: Text(
                            productInfo.isAvailable
                                ? "This Product Already Available"
                                : "This Product Already Sold",
                            style: TextStyles.textStyle14.copyWith(
                              fontWeight: FontWeight.w300,
                              color: ColorManager.darkGray,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Card(
                      margin: const EdgeInsets.all(0),
                      elevation: 12.0,
                      shadowColor: ColorManager.originalBlack,
                      color: ColorManager.primaryColor.withOpacity(0.9),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                        ),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ProductImagesView(
                                coverImage: productInfo.coverImage.image,
                                images: productInfo.images,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Text(
                                  '💰${productInfo.price}',
                                  style: TextStyles.textStyle26.copyWith(
                                      color: ColorManager.originalWhite),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('Error: Invalid'),
              );
            }
          },
        ),
      ),
    );
  }
}

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
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
          Container(
            color: Colors.red,
            width: 50.0,
            height: 50.0,
          ),
      options: CarouselOptions(
        viewportFraction: 0.96,
        initialPage: 0,
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollPhysics: const BouncingScrollPhysics(),
        height: MediaQuery.of(context).size.height * 0.24,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        enlargeFactor: 0.6,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, page) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.end,
    //   children: [
    //     // Row(
    //     //   mainAxisSize: MainAxisSize.min,
    //     //   children: [
    //     //     for (int i = 0; i < images.length; i++) ...[
    //     //       AnimatedContainer(
    //     //         duration: const Duration(milliseconds: 1200),
    //     //         curve: Curves.elasticInOut,
    //     //         child: Container(
    //     //           margin: const EdgeInsets.symmetric(horizontal: 3.0),
    //     //           width: i == _currentIndex ? 10.0 : 10.0,
    //     //           height: 10.0,
    //     //           decoration: BoxDecoration(
    //     //               color: i == _currentIndex
    //     //                   ? ColorManager.primaryColor
    //     //                   : ColorManager.originalWhite,
    //     //               borderRadius: BorderRadius.circular(50.0),
    //     //               border: Border.all(
    //     //                   color: i == _currentIndex
    //     //                       ? ColorManager.primaryColor
    //     //                       : Colors.black,
    //     //                   width: 0.8)),
    //     //         ),
    //     //       ),
    //     //     ],
    //     //   ],
    //     // ),
    //     SizedBox(
    //       height: MediaQuery.of(context).size.height * 0.24,
    //       child: CarouselSlider.builder(
    //         itemCount: images.length,
    //         itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
    //             Container(
    //               color: Colors.red,
    //               width: 50.0,
    //               height: 50.0,
    //             ),
    //         options: CarouselOptions(
    //           viewportFraction: 0.96,
    //           initialPage: 0,
    //           autoPlayCurve: Curves.fastOutSlowIn,
    //           scrollPhysics: const BouncingScrollPhysics(),
    //           height: MediaQuery.of(context).size.height * 0.24,
    //           enableInfiniteScroll: false,
    //           enlargeCenterPage: true,
    //           enlargeFactor: 0.6,
    //           scrollDirection: Axis.horizontal,
    //           onPageChanged: (index, page) {
    //             setState(() {
    //               _currentIndex = index;
    //             });
    //           },
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
