import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/events/presentation/view_model/event_cubit.dart';
import 'package:art_space_artist/features/events/presentation/view_model/event_state.dart';
import 'package:art_space_artist/features/events/presentation/views/widgets/artwork_item.dart';
import 'package:art_space_artist/features/events/presentation/views/widgets/custom_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        EventCubit cubit = context.read<EventCubit>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.originalWhite.withOpacity(0.0),
            leading: IconButton(
              onPressed: () => Navigator.of(
                context,
              ).pop(),
              icon: SvgPicture.asset(
                AssetsManager.icBackArrow,
                height: 40.0,
                colorFilter: const ColorFilter.mode(
                    ColorManager.originalWhite, BlendMode.srcIn),
              ),
            ),
          ),
          extendBodyBehindAppBar: true,
          body: cubit.eventInfo != null
              ? Stack(
                  children: [
                    Stack(
                      children: [
                        Image(
                          image: NetworkImage(cubit.eventInfo!.coverImage),
                          fit: BoxFit.cover,
                          width: double.maxFinite,
                          height: MediaQuery.of(context).size.height * 0.34,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: MediaQuery.of(context).size.height * 0.34,
                          color: ColorManager.originalBlack.withOpacity(0.2),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.22,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsetsDirectional.symmetric(
                                vertical: 16.0, horizontal: 18.0),
                            decoration: const BoxDecoration(
                              color: ColorManager.originalWhite,
                              borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(32),
                                topStart: Radius.circular(32),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          cubit.eventInfo!.title,
                                          style: TextStyles.textStyle30
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          AssetsManager.icEdit,
                                          height: 32.0,
                                          colorFilter: const ColorFilter.mode(
                                            ColorManager.primaryColor,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          AssetsManager.icTrash,
                                          height: 32.0,
                                          colorFilter: const ColorFilter.mode(
                                            Colors.red,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    cubit.eventInfo!.description,
                                    style: TextStyles.textStyle16,
                                  ),
                                  const SizedBox(height: 12.0),
                                  CustomInfoRow(
                                    text:
                                        'Duration: ${cubit.eventInfo!.duration} Days',
                                    icon: AssetsManager.icTime,
                                  ),
                                  CustomInfoRow(
                                    text:
                                        'Began: ${cubit.eventInfo!.began.split("T")[0]}',
                                    icon: AssetsManager.icCalender,
                                  ),
                                  CustomInfoRow(
                                    text:
                                        'End: ${cubit.eventInfo!.end.split("T")[0]}',
                                    icon: AssetsManager.icCalender,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Artworks",
                                        style: TextStyles.textStyle26,
                                      ),
                                      const Spacer(),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacementNamed(
                                              context,
                                              AppRouterNames.createProduct,
                                              arguments: cubit.eventInfo!.id);
                                        },
                                        child: const Text(
                                          "Add New Product",
                                          style: TextStyles.textStyle18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12.0),
                                  Row(
                                    children: [
                                      for (var i = 0;
                                          i < cubit.eventInfo!.products.length;
                                          i++) ...[
                                        Container(
                                          width: 180.0,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12.0),
                                          child: ArtworkItem(
                                            product:
                                                cubit.eventInfo!.products[i],
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: ColorManager.primaryColor,
                    size: 35.0,
                  ),
                ),
        );
      },
    );
  }
}
