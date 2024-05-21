import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/products/data/models/get_product_details_response.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_cubit.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_state.dart';
import 'package:art_space_artist/features/products/presentation/views/widgets/product_image_view.dart';
import 'package:art_space_artist/features/products/presentation/views/widgets/product_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ViewProductDetails extends StatelessWidget {
  const ViewProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is GetProductDetailsLoading) {
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                  color: ColorManager.primaryColor, size: 40),
            );
          } else if (state is GetProductDetailsSuccess) {
            ProductDetails? productInfo =
                context.read<ProductsCubit>().productDetails;
            return Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 18.0),
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
                                context.read<ProductsCubit>().emitDeleteProduct(
                                    productId: productInfo!.id);
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
                              height: MediaQuery.of(context).size.height * 0.14,
                            ),
                            ProductInformation(productInfo: productInfo!),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12.0),
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
                    elevation: 8.0,
                    shadowColor: ColorManager.originalBlack,
                    color: ColorManager.primaryColor.withOpacity(0.9),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(70),
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
                            const SizedBox(height: 0.0),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Text(
                                '﹩${productInfo.price}',
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
    );
  }
}
