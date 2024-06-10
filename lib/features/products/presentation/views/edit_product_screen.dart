import 'package:art_space_artist/core/components/create_text_form.dart';
import 'package:art_space_artist/features/products/data/models/get_product_details_response.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_cubit.dart';
import 'package:art_space_artist/features/products/presentation/views/widgets/custom_container_create_product.dart';
import 'package:art_space_artist/features/products/presentation/views/widgets/edit_product_listener.dart';
import 'package:art_space_artist/features/products/presentation/views/widgets/price_and_size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/default_button.dart';
import '../../../../core/constants/color_manager.dart';
import '../../../../core/constants/text_style.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key, required this.productDetails});
  final ProductDetails productDetails;
  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    titleController.text = productDetails.title.toString();
    var descriptionController = TextEditingController();
    descriptionController.text = productDetails.description.toString();
    var priceController = TextEditingController();
    priceController.text = productDetails.price.toString();
    var heightController = TextEditingController();
    heightController.text = productDetails.height.toString();
    var widthController = TextEditingController();
    widthController.text = productDetails.width.toString();
    var depthController = TextEditingController();
    depthController.text = productDetails.depth.toString();
    return Scaffold(
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
                    controller: titleController,
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
                    controller: descriptionController,
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
              style: TextStyles.textStyle24
                  .copyWith(color: ColorManager.originalBlack),
            ),
            const SizedBox(
              height: 8.0,
            ),
            CustomContainerForCreateProduct(
              widget: Column(
                children: [
                  PriceAndSizeWidget(
                    text: 'Price',
                    controller: priceController,
                  ),
                  PriceAndSizeWidget(
                    text: 'Height',
                    controller: heightController,
                  ),
                  PriceAndSizeWidget(
                    text: 'Width',
                    controller: widthController,
                  ),
                  PriceAndSizeWidget(
                    text: 'depth',
                    controller: depthController,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              'More images',
              style: TextStyles.textStyle24
                  .copyWith(color: ColorManager.originalBlack),
            ),
            const SizedBox(
              height: 8.0,
            ),
            DefaultButton(
              text: 'Update',
              onPressed: () => context.read<ProductsCubit>().emitEditProduct(
                id: productDetails.id,
                  title: titleController.text,
                  description: descriptionController.text,
                  price: priceController.text,
                  height: heightController.text,
                  weight: widthController.text,
                  depth: depthController.text
              ),
            ),
            const EditProductListener()
          ],
        ),
      ),
    );
  }
}
