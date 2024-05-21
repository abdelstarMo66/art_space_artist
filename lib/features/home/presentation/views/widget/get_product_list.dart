import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/home/presentation/view_model/home_cubit.dart';
import 'package:art_space_artist/features/home/presentation/view_model/home_state.dart';
import 'package:art_space_artist/features/home/presentation/views/widget/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/app_customer_shimmer.dart';

class GetProductList extends StatelessWidget {
  const GetProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      HomeCubit cubit = context.read<HomeCubit>();
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: MediaQuery.of(context).size.height * 0.02,
              crossAxisSpacing: 16.0,
              mainAxisExtent: MediaQuery.of(context).size.height * 0.235),
          itemBuilder: (context, index) => cubit.myProducts.isEmpty
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
                  productInfo: cubit.myProducts[index] ,
                ),
          itemCount: cubit.myProducts.isEmpty
              ? 6
              : cubit.myProducts.length,
        ),
      );
    });
  }
}
