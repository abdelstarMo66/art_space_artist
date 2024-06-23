import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/home/presentation/view_model/home_cubit.dart';
import 'package:art_space_artist/features/home/presentation/view_model/home_state.dart';
import 'package:art_space_artist/features/home/presentation/views/widget/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/components/app_customer_shimmer.dart';
import '../../../../../core/constants/assets_manager.dart';
import '../../../../../core/constants/text_style.dart';

class GetProductList extends StatelessWidget {
  const GetProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      HomeCubit cubit = context.read<HomeCubit>();
      if (cubit.myProducts.isEmpty && state is GetHomeProductSuccess) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetsManager.imgDataEmpty,
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Not artworks founded',
                style: TextStyles.textStyle18,
              ),
            ],
          ),
        );
      }
      else {
        return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 16.0,
          ),
          itemBuilder: (context, index) => state is GetHomeProductLoading || cubit.availableProduct.isEmpty
              ? AppCustomShimmer(
                  child: Container(
                    height: 200.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              : CustomProductViewWidget(
                  productInfo: cubit.availableProduct[index] ,
                ),
          itemCount: cubit.availableProduct.isEmpty
              ? 6
              : cubit.availableProduct.length,
        ),
      );
      }
    });
  }
}
