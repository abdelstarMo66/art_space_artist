import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/constants/toast_color.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../core/constants/constants.dart';


class EditProductImages extends StatelessWidget {
  const EditProductImages({super.key, required this.coverImage});

  final String coverImage;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listenWhen: (previous, current) =>
          current is DeleteSpecificImageLoading ||
          current is DeleteSpecificImageSuccess ||
          current is DeleteSpecificImageError,
      listener: (context, state) {
        if (state is DeleteSpecificImageLoading) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: LoadingAnimationWidget.inkDrop(
                  color: ColorManager.primaryColor, size: 45),
            ),
          );
        }
        if (state is DeleteSpecificImageSuccess) {
          Navigator.pop(context);
          showToast(
            msg: "Delete image success",
            state: ToastState.success,
          );
        }
        if (state is DeleteSpecificImageError) {
          Navigator.pop(context);
          showToast(
            msg: "something went wrong",
            state: ToastState.error,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Edit Product Images',
            ),
          ),
          body: ListView(
            children: [
              const Text(
                'Change cover images',
                style: TextStyles.textStyle18,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(18.0),
                      child: Image.network(
                        coverImage,
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        AssetsManager.icEdit,
                        height: 40,
                        colorFilter: const ColorFilter.mode(
                            ColorManager.primaryColor, BlendMode.srcIn),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Other images',
                style: TextStyles.textStyle18,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Builder(
                builder: (context) => Wrap(
                  spacing: 15.0,
                  children: [
                    for (int i = 0; i < 4; i++)
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.network(
                                coverImage,
                                fit: BoxFit.cover,
                                height: 100.0,
                                width: 100.0,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: ColorManager.originalWhite,
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
                      onTap: () async {},
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: ColorManager.lightGray.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: SvgPicture.asset(
                          AssetsManager.icAdd,
                          height: 75.0,
                          colorFilter: const ColorFilter.mode(
                              ColorManager.primaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
