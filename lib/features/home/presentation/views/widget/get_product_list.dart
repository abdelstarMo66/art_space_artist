import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/home/presentation/views/widget/product_list_item.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_cubit.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetProductList extends StatelessWidget {
  const GetProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMyProductsCubit, GetMyProductsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing:
                MediaQuery.of(context).size.height * 0.02,
                crossAxisSpacing: 16.0,
                mainAxisExtent:
                MediaQuery.of(context).size.height * 0.3),
            itemBuilder: (context, index) =>  InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRouterNames.viewProductDetails);
                },
                child: CustomProductViewWidget(index: index,)),
            itemCount: context.read<GetMyProductsCubit>().myProducts!.length,
          ),
        );
      }
    );
  }
}
