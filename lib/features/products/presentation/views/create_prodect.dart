import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/features/products/presentation/views/widgets/create_prodect_text_form.dart';
import 'package:art_space_artist/features/products/presentation/views/widgets/custom_container_create_product.dart';
import 'package:art_space_artist/features/products/presentation/views/widgets/price_and_size_widget.dart';
import 'package:art_space_artist/features/products/presentation/views/widgets/type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateProduct extends StatelessWidget {
  const CreateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
            vertical: 10.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(25),
                        border: Border.all(
                          color: Colors.green,
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetsManager.icImage,
                          height: 110,
                          colorFilter: const ColorFilter.mode(
                              Colors.green, BlendMode.srcIn),
                        ),
                        const Text(
                          'Tap here to add cover',
                          style: TextStyles.textStyle18,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                CustomContainerForCreateProduct(
                  height: 240,
                  widget: Column(
                    children: [
                      CreateProductTextForm(
                        padding: 15,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.name,
                        text: 'Add name',
                        controller: nameController,
                        validator: (value) {},
                        widget: const Text(
                          'Name',
                          style: TextStyles.textStyle18,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Divider(
                        color: ColorManager.originalBlack,
                        endIndent: MediaQuery.of(context).size.width * 0.15,
                        indent: MediaQuery.of(context).size.width * 0.15,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      SizedBox(
                        height: 140.0,
                        child: CreateProductTextForm(
                          padding: 15,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.multiline,
                          validator: (value) {},
                          controller: nameController,
                          text: 'Description ....',
                          maxLines: 6,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Price and Size',
                  style: TextStyles.textStyle30
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomContainerForCreateProduct(
                  height: 180,
                  widget: Column(
                    children: [
                      PriceAndSizeWidget(
                        widget: SvgPicture.asset(
                          AssetsManager.icMoney,
                          colorFilter: const ColorFilter.mode(
                              ColorManager.primaryColor, BlendMode.srcIn),
                          height: 40,
                        ),
                        text: 'Price',
                        controller: nameController,
                      ),
                      PriceAndSizeWidget(
                        widget: SvgPicture.asset(
                          AssetsManager.icMoney,
                          colorFilter: const ColorFilter.mode(
                              ColorManager.primaryColor, BlendMode.srcIn),
                          height: 40,
                        ),
                        text: 'Height',
                        controller: nameController,
                      ),
                      PriceAndSizeWidget(
                        widget: SvgPicture.asset(
                          AssetsManager.icMoney,
                          colorFilter: const ColorFilter.mode(
                              ColorManager.primaryColor, BlendMode.srcIn),
                          height: 40,
                        ),
                        text: 'Width',
                        controller: nameController,
                      ),
                      PriceAndSizeWidget(
                        widget: SvgPicture.asset(
                          AssetsManager.icMoney,
                          colorFilter: const ColorFilter.mode(
                              ColorManager.primaryColor, BlendMode.srcIn),
                          height: 40,
                        ),
                        text: 'depth',
                        controller: nameController,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Type',
                  style: TextStyles.textStyle30
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomContainerForCreateProduct(
                  height: 240,
                  widget: Column(
                    children: [
                      const TypeWidget(items: [
                        DropdownMenuItem(
                          child: Text(
                            'Category 1',
                            style: TextStyles.textStyle18,
                          ),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Category 2',
                            style: TextStyles.textStyle18,
                          ),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Category 3',
                            style: TextStyles.textStyle18,
                          ),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Category 4',
                            style: TextStyles.textStyle18,
                          ),
                          value: 3,
                        ),
                      ], text: 'Category'),
                      const TypeWidget(items: [
                        DropdownMenuItem(
                          child: Text(
                            'Style 1',
                            style: TextStyles.textStyle18,
                          ),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Style 2',
                            style: TextStyles.textStyle18,
                          ),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Style 3',
                            style: TextStyles.textStyle18,
                          ),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Style 4',
                            style: TextStyles.textStyle18,
                          ),
                          value: 3,
                        ),
                      ], text: 'Style'),
                      const TypeWidget(items: [
                        DropdownMenuItem(
                          child: Text(
                            'Subject 1',
                            style: TextStyles.textStyle18,
                          ),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Subject 2',
                            style: TextStyles.textStyle18,
                          ),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Subject 3',
                            style: TextStyles.textStyle18,
                          ),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Subject 4',
                            style: TextStyles.textStyle18,
                          ),
                          value: 3,
                        ),
                      ], text: 'Subject'),
                      CreateProductTextForm(
                        text: 'Add material ...',
                        controller: nameController,
                        validator: (value) {},
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.start,
                        padding: 15.0,
                        widget: const Text(
                          'Material',
                          style: TextStyles.textStyle18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'More images',
                  style: TextStyles.textStyle30
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                              'https://img.freepik.com/free-vector/beautiful-purple-woman-surrounded-by-nature-illustration_53876-97561.jpg?t=st=1711014691~exp=1711018291~hmac=90d2c375bbeaf97227842f2e049e29640e1bbb1da8ca5df1e55fb992499b4987&w=740')),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration:
                          BoxDecoration(color: ColorManager.customGreyColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: SvgPicture.asset(
                        AssetsManager.icAdd,
                        colorFilter: const ColorFilter.mode(
                            ColorManager.primaryColor, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
