import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/constants/toast_color.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_cubit.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/color_manager.dart';
import '../../../../../core/network/api_error_handler.dart';

class EditProductListener extends StatelessWidget {
  const EditProductListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductsCubit, ProductsState>(
      listenWhen: (previous, current) =>
      current is EditProductLoading ||
      current is EditProductSuccess ||
      current is EditProductError,
      listener: (context, state) {
        state.whenOrNull(
          editProductLoading: () {
          showDialog(
            context: context,
            builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                )),
          );
        },
          editProductSuccess: (data) {
            Navigator.of(context).pop();
            showToast(
                msg: 'Product updated successfully',
                state: ToastState.success);
            Navigator.of(context).pushNamedAndRemoveUntil(AppRouterNames.home, (route) => false,);
          },
          editProductError: (error) {
            Navigator.of(context).pop();
            showToast(
              msg: error,
              state: ToastState.error,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
