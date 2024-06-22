import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/features/auction/presentation/view_model/auction_cubit.dart';
import 'package:art_space_artist/features/auction/presentation/view_model/auction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/components/create_text_form.dart';
import '../../../../core/components/default_button.dart';
import '../../../../core/components/loading_widget.dart';
import '../../../../core/constants/color_manager.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/text_style.dart';
import '../../../../core/constants/toast_color.dart';
import '../../../../core/router/app_router_names.dart';
import '../../../products/presentation/views/widgets/custom_container_create_product.dart';
import '../../../products/presentation/views/widgets/price_and_size_widget.dart';
import '../../../products/presentation/views/widgets/type_widget.dart';

class CreateAuctionScreen extends StatefulWidget {
  const CreateAuctionScreen({super.key});

  @override
  State<CreateAuctionScreen> createState() => _CreateAuctionScreenState();
}

class _CreateAuctionScreenState extends State<CreateAuctionScreen> {
  int style = 0;
  int category = 0;
  int subject = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuctionCubit, AuctionState>(
      listener: (context, state) {
        if (state is CreateAuctionLoading) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: LoadingAnimationWidget.inkDrop(
                  color: ColorManager.primaryColor, size: 45),
            ),
          );
        }
        if (state is CreateAuctionSuccess) {
          Navigator.pop(context);
          showToast(
            msg: "Add Product Success",
            state: ToastState.success,
          );

          Navigator.of(context).pushReplacementNamed(AppRouterNames.home);
        }
        if (state is CreateAuctionError) {
          Navigator.pop(context);
          showToast(
            msg: state.error,
            state: ToastState.error,
          );
        }
      },
      builder: (context, state) {
        AuctionCubit cubit = context.read<AuctionCubit>();
        if (!cubit.getCategoriesSuccess || !cubit.getStylesSuccess || !cubit.getSubjectsSuccess) {
          return const LoadingWidget();
        } else {
          return Scaffold(
            backgroundColor: ColorManager.originalWhite,
            appBar: AppBar(
              scrolledUnderElevation: 0.0,
              title: const Text('Create Auction'),
              leading: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: SvgPicture.asset(
                    AssetsManager.icBackArrow,
                  )),
              leadingWidth: 35,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                horizontal: 18, vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(18),
                              border: Border.all(
                                width: 0.8,
                                color: Colors.green,
                              ),
                            ),
                            child: cubit.coverImage != null
                                ? ClipRRect(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(18.0),
                                    child: Image.file(
                                      cubit.coverImage!,
                                      fit: BoxFit.fill,
                                      height: 200,
                                      width: 400,
                                    ),
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Opacity(
                                        opacity: 0.6,
                                        child: SvgPicture.asset(
                                          AssetsManager.icImage,
                                          height: 120,
                                          colorFilter: const ColorFilter.mode(
                                            Colors.green,
                                            BlendMode.srcIn,
                                          ),
                                        ),
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
                        widget: Column(
                          children: [
                            CreateTextForm(
                              padding: 12,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.name,
                              text: 'Add name',
                              controller: cubit.nameController,
                              validator: (value) {
                                if (value == null || value.length <= 3) {
                                  return 'please enter name';
                                }
                                return null;
                              },
                              widget: const Text(
                                'Name',
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
                              controller: cubit.descriptionController,
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
                              hintText: '0',
                              text: 'Initial price',
                              controller: cubit.priceController,
                            ),
                            PriceAndSizeWidget(
                              hintText: '0',
                              text: 'Height',
                              controller: cubit.heightController,
                            ),
                            PriceAndSizeWidget(
                              hintText: '0',
                              text: 'Width',
                              controller: cubit.widthController,
                            ),
                            PriceAndSizeWidget(
                              hintText: '0',
                              text: 'depth',
                              controller: cubit.depthController,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Type',
                        style: TextStyles.textStyle24
                            .copyWith(color: ColorManager.originalBlack),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      CustomContainerForCreateProduct(
                        widget: Column(
                          children: [
                            TypeWidget(
                              value: category,
                              items: cubit.categories!
                                  .asMap()
                                  .map(
                                    (key, value) => MapEntry(
                                      key,
                                      DropdownMenuItem(
                                        value: key,
                                        child: Text(
                                          value.title!,
                                          style: TextStyles.textStyle18,
                                        ),
                                      ),
                                    ),
                                  )
                                  .values
                                  .toList(),
                              text: 'Category',
                              onChanged: (value) {
                                setState(() {
                                  category = value;
                                  cubit.categoryId =
                                      cubit.categories![value].id;
                                });
                              },
                            ),
                            TypeWidget(
                              value: style,
                              items: cubit.styles!
                                  .asMap()
                                  .map(
                                    (key, value) => MapEntry(
                                      key,
                                      DropdownMenuItem(
                                        value: key,
                                        child: Text(
                                          value.title!,
                                          style: TextStyles.textStyle18,
                                        ),
                                      ),
                                    ),
                                  )
                                  .values
                                  .toList(),
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
                                items: cubit.subjects!
                                    .asMap()
                                    .map(
                                      (key, value) => MapEntry(
                                        key,
                                        DropdownMenuItem(
                                          value: key,
                                          child: Text(
                                            value.title!,
                                            style: TextStyles.textStyle18,
                                          ),
                                        ),
                                      ),
                                    )
                                    .values
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    subject = value;
                                    cubit.subjectId = cubit.subjects![value].id;
                                  });
                                },
                                text: 'Subject'),
                            CreateTextForm(
                              padding: 12,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              text: 'material',
                              controller: cubit.materialController,
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
                      Text(
                        'Time',
                        style: TextStyles.textStyle24
                            .copyWith(color: ColorManager.originalBlack),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      CustomContainerForCreateProduct(
                        widget: Column(
                          children: [
                            CreateTextForm(
                              padding: 12,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              text: ' Maximum 14 days',
                              controller: cubit.durationController,
                              validator: (value) {
                                if (value == null) {
                                  return 'please valid duration';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              widget: const Text(
                                'Duration',
                                style: TextStyles.textStyle18,
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            CreateTextForm(
                              padding: 12,
                              readOnly:  true,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              onTap: () => context.read<AuctionCubit>().selectDate(context: context),
                              text: 'tap to open calendar',
                              controller: cubit.beganController,
                              validator: (value) {
                                if (value == null) {
                                  return 'please enter name';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.datetime,
                              widget: const Text(
                                'Began',
                                style: TextStyles.textStyle18,
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
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
                      Builder(
                        builder: (context) => Wrap(
                          spacing: 12.0,
                          children: [
                            for (int i = 0; i < cubit.images.length; i++)
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: Image.file(
                                      cubit.images[i],
                                      fit: BoxFit.cover,
                                      height: 100.0,
                                      width: 100.0,
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
                                          ColorManager.originalWhite,
                                      radius: 16,
                                      child: SvgPicture.asset(
                                        AssetsManager.icTrash,
                                        height: 28.0,
                                        colorFilter: const ColorFilter.mode(
                                          ColorManager.primaryColor,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            InkWell(
                              onTap: () async {
                                cubit.images.add(await cubit.getImages());
                                setState(()  {

                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color:
                                      ColorManager.lightGray.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: SvgPicture.asset(
                                  AssetsManager.icAdd,
                                  height: 75.0,
                                  colorFilter: const ColorFilter.mode(
                                      ColorManager.primaryColor,
                                      BlendMode.srcIn),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      DefaultButton(
                        text: 'Create',
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate() &&
                              cubit.coverImage != null) {
                            cubit.createAuction();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
