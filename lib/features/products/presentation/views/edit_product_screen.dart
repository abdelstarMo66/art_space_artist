import 'package:art_space_artist/core/components/create_text_form.dart';
import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/products/data/models/edit_product_request_body.dart';
import 'package:art_space_artist/features/products/data/models/get_product_details_response.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_cubit.dart';
import 'package:art_space_artist/features/products/presentation/views/widgets/custom_container_create_product.dart';
import 'package:art_space_artist/features/products/presentation/views/widgets/edit_product_listener.dart';
import 'package:art_space_artist/features/products/presentation/views/widgets/price_and_size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/components/default_button.dart';
import '../../../../core/constants/color_manager.dart';
import '../../../../core/constants/text_style.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key, required this.productDetails});
  final ProductDetails productDetails;
  @override
  Widget build(BuildContext context) {

    ProductsCubit cubit = context.read<ProductsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit product'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            CustomContainerForCreateProduct(
              widget: Column(
                children: [
                  CreateTextForm(
                    padding: 12,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.name,
                    text: 'Add new title',
                    controller: cubit.editTitleController,
                    validator: (value) {
                      if (value == null || value.length == 3) {
                        return 'please enter name';
                      }
                      return null;
                    },
                    widget: const Text(
                      'Title',
                      style: TextStyles.textStyle18,
                    ),
                    maxLines: 1,
                  ),
                  const Divider(
                    color: ColorManager.lighterGray,
                    height: 30.0,
                    thickness: 2.0,
                    indent: 40.0,
                    endIndent: 40.0,
                  ),
                  CreateTextForm(
                    padding: 12,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.hashCode < 15) {
                        return 'please enter description';
                      }
                      return null;
                    },
                    controller: cubit.editDescriptionController,
                    text: 'Description....',
                    minLines: 5,
                    maxLength: 500,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              'Price and Size',
              style: TextStyles.textStyle20
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8.0,
            ),
            CustomContainerForCreateProduct(
              widget: Column(
                children: [
                  PriceAndSizeWidget(
                    hintText: productDetails.price.toString(),
                    text: 'Price',
                    controller: cubit.editPriceController,
                  ),
                  PriceAndSizeWidget(
                    hintText: productDetails.height.toString(),
                    text: 'Height',
                    controller: cubit.editHeightController,
                  ),
                  PriceAndSizeWidget(
                    hintText: productDetails.width.toString(),
                    text: 'Width',
                    controller: cubit.editWidthController,
                  ),
                  PriceAndSizeWidget(
                    hintText: productDetails.height.toString(),
                    text: 'depth',
                    controller: cubit.editDepthController,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            DefaultButton(
              text: 'Update',
              onPressed: () => context.read<ProductsCubit>().emitEditProduct(
                  id: productDetails.id,
                  editProductRequestBody: EditProductRequestBody(
                      title: cubit.editTitleController.text == ""
                          ? productDetails.title
                          : cubit.editTitleController.text,
                      description: cubit.editDescriptionController.text == ""
                          ? productDetails.title
                          : cubit.editDescriptionController.text,
                      price: cubit.editPriceController.text == ""
                          ? productDetails.title
                          : cubit.editPriceController.text,
                      height: cubit.editHeightController.text == ""
                      ? productDetails.title
                          : cubit.editHeightController.text,
                      weight: cubit.editWidthController.text == ""
                          ? productDetails.title
                          : cubit.editWidthController.text,
                      depth: cubit.editDepthController.text == ""
                          ? productDetails.title
                          : cubit.editDepthController.text,)
              ),
            ),
            const EditProductListener()
          ],
        ),
      ),
    );
  }
}
