import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/di/dependency_injection.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_cubit.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ViewProductDetails extends StatelessWidget {
  final int index;
  const ViewProductDetails({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
        ),
        child: BlocProvider.value(
          value: getIt<ProductsCubit>()..emitGetProductDetails(index: index),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: SvgPicture.asset(
                              AssetsManager.icBackArrow,
                              height: 40.0,
                            ),
                            onTap: () => Navigator.of(context).pop(),
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
                          GestureDetector(
                            onTap: () {
                              context.read<ProductsCubit>().emitDeleteProduct(index: index);
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
                            height: MediaQuery.of(context).size.height * 0.2,
                          ),
                          Text(
                            '${productInfo!.title}',
                            style: TextStyles.textStyle30
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            '${productInfo.description}',
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
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Height : ${productInfo.height}',
                                    style: TextStyles.textStyle18,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Width : ${productInfo.width}',
                                    style: TextStyles.textStyle18,
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Depth : ${productInfo.depth}',
                                    style: TextStyles.textStyle18,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'category : ${productInfo.category}',
                                      style: TextStyles.textStyle18,
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      'material : ${productInfo.material}',
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
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100))),
                        child: SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  AnimatedSmoothIndicator(
                                    activeIndex: 0,
                                    count: productInfo.productImage == null
                                        ? 0
                                        : productInfo.productImage!.length,
                                    axisDirection: Axis.vertical,
                                    effect: const ExpandingDotsEffect(
                                      activeDotColor:
                                          ColorManager.originalBlack,
                                      dotColor: ColorManager.originalWhite,
                                      dotHeight: 5,
                                      dotWidth: 20,
                                      spacing: 15,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(25),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Image.network(
                                        '${productInfo.coverImage!.profileImg}',
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  '\$${productInfo.price}',
                                  style: TextStyles.textStyle26.copyWith(
                                      color: ColorManager.originalWhite),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  'price',
                                  style: TextStyles.textStyle12.copyWith(
                                      color: ColorManager.originalWhite),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
