import 'package:art_space_artist/core/components/loading_widget.dart';
import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_cubit.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_state.dart';
import 'package:art_space_artist/features/products/presentation/views/widgets/create_product_text_form.dart';
import 'package:art_space_artist/features/products/presentation/views/widgets/custom_container_create_product.dart';
import 'package:art_space_artist/features/products/presentation/views/widgets/price_and_size_widget.dart';
import 'package:art_space_artist/features/products/presentation/views/widgets/type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../core/components/default_button.dart';
import '../../../../core/di/dependency_injection.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  int style = 0;
  int category = 0;
  int subject = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ProductsCubit>(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is AddProductLoading) {
            return const LoadingWidget();
          } else {
            var cubit = context.read<ProductsCubit>();
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: GestureDetector(
                              onTap: () => cubit.getCoverImage(),
                              child: Container(
                                padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(25),
                                    border: Border.all(
                                      color: Colors.green,
                                    )),
                                child: cubit.coverImage != null
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(25),
                                        child: Image.file(
                                          cubit.coverImage!,
                                          fit: BoxFit.cover,
                                          height: 200,
                                          width: 400,
                                        ))
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                  controller: cubit.nameController,
                                  validator: (value) {
                                    if (value == null || value.length == 3) {
                                      return 'please enter name';
                                    }
                                    return null;
                                  },
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
                                  endIndent:
                                      MediaQuery.of(context).size.width * 0.15,
                                  indent:
                                      MediaQuery.of(context).size.width * 0.15,
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
                                    validator: (value) {
                                      if (value == null || value.hashCode < 15) {
                                        return 'please enter description';
                                      }
                                      return null;
                                    },
                                    controller: cubit.descriptionController,
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
                            style: TextStyles.textStyle26
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
                                        ColorManager.primaryColor,
                                        BlendMode.srcIn),
                                    height: 40,
                                  ),
                                  text: 'Price',
                                  controller: cubit.priceController,
                                ),
                                PriceAndSizeWidget(
                                  widget: SvgPicture.asset(
                                    AssetsManager.icMoney,
                                    colorFilter: const ColorFilter.mode(
                                        ColorManager.primaryColor,
                                        BlendMode.srcIn),
                                    height: 40,
                                  ),
                                  text: 'Height',
                                  controller: cubit.heightController,
                                ),
                                PriceAndSizeWidget(
                                  widget: SvgPicture.asset(
                                    AssetsManager.icMoney,
                                    colorFilter: const ColorFilter.mode(
                                        ColorManager.primaryColor,
                                        BlendMode.srcIn),
                                    height: 40,
                                  ),
                                  text: 'Width',
                                  controller: cubit.widthController,
                                ),
                                PriceAndSizeWidget(
                                  widget: SvgPicture.asset(
                                    AssetsManager.icMoney,
                                    colorFilter: const ColorFilter.mode(
                                        ColorManager.primaryColor,
                                        BlendMode.srcIn),
                                    height: 40,
                                  ),
                                  text: 'depth',
                                  controller: cubit.depthController,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Type',
                            style: TextStyles.textStyle26
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          CustomContainerForCreateProduct(
                            height: 240,
                            widget: Column(
                              children: [
                                TypeWidget(
                                  value: category,
                                  items: [
                                    for (int i = 0;
                                        i < cubit.categories!.length;
                                        i++)
                                      DropdownMenuItem(
                                        value: i,
                                        child: Text(
                                          '${cubit.categories![i].title}',
                                          style: TextStyles.textStyle18,
                                        ),
                                      ),
                                  ],
                                  text: 'Category',
                                  onChanged: (value) {
                                    setState(() {
                                      category = value;
                                      cubit.categoryId = cubit.categories![value].id;
                                    });
                                  },
                                ),
                                TypeWidget(
                                  value: style,
                                  items: [
                                    for (int i = 0; i < cubit.styles!.length; i++)
                                      DropdownMenuItem(
                                        value: i,
                                        child: Text(
                                          cubit.styles![i].title,
                                          style: TextStyles.textStyle18,
                                        ),
                                      ),
                                  ],
                                  text: 'Style',
                                  onChanged: (value) {
                                    setState(() {
                                      style = value;
                                      cubit.styleId = cubit.styles![value].id;
                                    });
                                  },
                                ),
                                TypeWidget(
                                    value: subject,
                                    items: [
                                  for (int i = 0; i < cubit.subjects!.length; i++)
                                    DropdownMenuItem(
                                      value: i,
                                      child: Text(
                                        '${cubit.subjects![i].title}',
                                        style: TextStyles.textStyle18,
                                      ),
                                    ),
                                ], onChanged: (value) {
                                  setState(() {
                                    subject = value;
                                    cubit.subjectId = cubit.subjects![value].id;
                                  });
                                }, text: 'Subject'),
                                CreateProductTextForm(
                                  text: 'Add material ...',
                                  controller: cubit.materialController,
                                  validator: (value) {
                                    return null;
                                  },
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
                            style: TextStyles.textStyle26
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Wrap(
                            spacing: 12.0,
                            children: [
                              if (cubit.images.isNotEmpty)
                                for (int i = 0; i < cubit.images.length; i++)
                                  Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.2,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.file(cubit.images[i],
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            cubit.deleteImage(index: i);
                                          });
                                        },
                                        child: CircleAvatar(
                                          backgroundColor:
                                              ColorManager.primaryColor,
                                          radius: 12,
                                          child: SvgPicture.asset(
                                            AssetsManager.icTrash,
                                            colorFilter: const ColorFilter.mode(
                                                ColorManager.originalWhite,
                                                BlendMode.srcIn),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    cubit.getImages();
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                      color: ColorManager.gray,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: SvgPicture.asset(
                                    AssetsManager.icAdd,
                                    colorFilter: const ColorFilter.mode(
                                        ColorManager.primaryColor,
                                        BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          DefaultButton(
                            text: 'Add',
                            onPressed: (){
                              cubit.addProduct();
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
