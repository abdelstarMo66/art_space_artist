import 'package:art_space_artist/core/components/loading_widget.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/home/presentation/views/widget/product_list_item.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_cubit.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../core/components/app_customer_shimmer.dart';
import '../../../../../core/constants/color_manager.dart';

class GetProductList extends StatelessWidget {
  const GetProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
      if (state is GetProductLoading) {
        return const LoadingWidget();
      } else {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: MediaQuery.of(context).size.height * 0.02,
                crossAxisSpacing: 16.0,
                mainAxisExtent: MediaQuery.of(context).size.height * 0.3),
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, AppRouterNames.viewProductDetails,
                      arguments: index);
                },
                child: context.read<ProductsCubit>().myProducts == null
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
                        index: index,
                      )),
            itemCount: context.read<ProductsCubit>().myProducts == null
                ? 4
                : context.read<ProductsCubit>().myProducts!.length,
          ),
        );
      }
    });
  }
}
