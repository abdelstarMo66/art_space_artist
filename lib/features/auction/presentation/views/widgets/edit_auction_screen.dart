import 'package:art_space_artist/core/components/default_button.dart';
import 'package:art_space_artist/features/auction/data/models/get_auction_details_response.dart';
import 'package:art_space_artist/features/auction/presentation/view_model/auction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/components/create_text_form.dart';
import '../../../../../core/constants/assets_manager.dart';
import '../../../../../core/constants/color_manager.dart';
import '../../../../../core/constants/text_style.dart';
import '../../../../products/presentation/views/widgets/custom_container_create_product.dart';
import '../../../../products/presentation/views/widgets/price_and_size_widget.dart';
import '../../../data/models/edit_auction_request_body.dart';
import 'edit_auction_listener.dart';

class EditAuctionScreen extends StatelessWidget {
  const EditAuctionScreen({super.key, required this.auctionInfo});

  final AuctionInfo auctionInfo;

  @override
  Widget build(BuildContext context) {
    AuctionCubit cubit = context.read<AuctionCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit auction'),
        leadingWidth: 35,
        leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: SvgPicture.asset(
              AssetsManager.icBackArrow,
            ),),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            CustomContainerForCreateProduct(
              widget: Column(
                children: [
                  CreateTextForm(
                    padding: 12,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.name,
                    text: auctionInfo.title,
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
                    text: auctionInfo.description,
                    minLines: 5,
                    maxLength: 500,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            CustomContainerForCreateProduct(
              widget: Column(
                children: [
                  PriceAndSizeWidget(
                    hintText: auctionInfo.price.toString(),
                    text: 'Price',
                    controller: cubit.editPriceController,
                  ),
                  CreateTextForm(
                    padding: 12,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    text: auctionInfo.began.split("T")[0],
                    controller: cubit.editBeganController,
                    validator: (value) {
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    widget: const Text(
                      'Began',
                      style: TextStyles.textStyle18,
                    ),
                  ),
                  PriceAndSizeWidget(
                    hintText: auctionInfo.duration.toString(),
                    text: 'duration',
                    controller: cubit.editDurationController,
                  ),
                  CreateTextForm(
                    padding: 12,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    text: 'material',
                    controller: cubit.editMaterialController,
                    validator: (value) {
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    widget: const Text(
                      'Material',
                      style: TextStyles.textStyle18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            ListTile(
              //onTap: () => Navigator.of(context).pushNamed(AppRouterNames.editProductImages, arguments: productDetails.coverImage.image),
              title: Text(
                'Edit auction images',
                style: TextStyles.textStyle18.copyWith(
                  color: ColorManager.originalBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: SvgPicture.asset(
                AssetsManager.icImage,
                height: MediaQuery.of(context).size.height * 0.06,
                colorFilter: const ColorFilter.mode(
                  ColorManager.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            const EditAuctionListener(),
            DefaultButton(
                text: 'Save',
                onPressed: () {
                  cubit.emitEditAuction(
                    auctionId: auctionInfo.id,
                    editAuctionRequestBody: EditAuctionRequestBody(
                      title: cubit.editTitleController.text == ""
                          ? auctionInfo.title
                          : cubit.editTitleController.text,
                      description: cubit.editDescriptionController.text == ""
                          ? auctionInfo.description
                          : cubit.editDescriptionController.text,
                      material: cubit.editMaterialController.text == ""
                          ? auctionInfo.material
                          : cubit.editMaterialController.text,
                      duration: cubit.editDurationController.text == ""
                          ? auctionInfo.duration.toString()
                          : cubit.editDurationController.text,
                      price: cubit.editPriceController.text == ""
                          ? auctionInfo.price.toString()
                          : cubit.editPriceController.text,
                      began: cubit.editBeganController.text == ""
                          ? auctionInfo.began
                          : cubit.editBeganController.text,
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
