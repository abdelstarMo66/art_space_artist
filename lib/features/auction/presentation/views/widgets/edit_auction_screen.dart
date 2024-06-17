import 'package:art_space_artist/core/components/default_button.dart';
import 'package:art_space_artist/features/auction/data/models/get_auction_details_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/components/create_text_form.dart';
import '../../../../../core/constants/assets_manager.dart';
import '../../../../../core/constants/color_manager.dart';
import '../../../../../core/constants/text_style.dart';
import '../../../../products/presentation/views/widgets/custom_container_create_product.dart';
import '../../../../products/presentation/views/widgets/price_and_size_widget.dart';

class EditAuctionScreen extends StatelessWidget {
  const EditAuctionScreen({super.key, required this.auctionInfo});
    final AuctionInfo auctionInfo;
  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    titleController.text = auctionInfo.title.toString();
    var descriptionController = TextEditingController();
    descriptionController.text = auctionInfo.description.toString();
    var priceController = TextEditingController();
    priceController.text = auctionInfo.price.toString();
    var materialController = TextEditingController();
    materialController.text = auctionInfo.style.toString();
    var beganController = TextEditingController();
    beganController.text = auctionInfo.began.toString().split("T")[0];
    var durationController = TextEditingController();
    durationController.text = auctionInfo.duration.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit auction'),
        leadingWidth: 35,
        leading: SvgPicture.asset(AssetsManager.icBackArrow),
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
              height: 15.0,
            ),
            CustomContainerForCreateProduct(
              widget: Column(
                children: [
                  PriceAndSizeWidget(
                    text: 'Price',
                    controller: priceController,
                  ),
                  CreateTextForm(
                    padding: 12,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    text: 'Began',
                    controller: beganController,
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
                    text: 'duration',
                    controller: durationController,
                  ),
                  CreateTextForm(
                    padding: 12,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    text: 'material',
                    controller: materialController,
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
                  ColorManager.primaryColor, BlendMode.srcIn,),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            DefaultButton(text: 'Save', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
