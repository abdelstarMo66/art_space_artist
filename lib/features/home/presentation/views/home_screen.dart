import 'package:art_space_artist/core/components/loading_widget.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/di/dependency_injection.dart';
import 'package:art_space_artist/features/home/presentation/view_model/home_cubit.dart';
import 'package:art_space_artist/features/home/presentation/view_model/home_state.dart';
import 'package:art_space_artist/features/home/presentation/views/widget/filter_product_widget.dart';
import 'package:art_space_artist/features/home/presentation/views/widget/get_product_list.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/profile_state.dart';
import 'package:art_space_artist/features/profile/presentation/views/profile_drawer_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeCubit>()
            ..emitGetMyProducts()
            ..emitGetAllEvents(),
        ),
        BlocProvider(
          create: (context) => getIt<ProfileCubit>()..emitGetProfileStates(),
        ),
      ],
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is GetProfileLoading) {
            return const LoadingWidget();
          } else {
            var cubit = context.read<HomeCubit>();
            return Scaffold(
              backgroundColor: ColorManager.originalWhite,
              drawer: const CustomProfileDrawer(),
              appBar: AppBar(
                scrolledUnderElevation: 0.0,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).welcome,
                      style: TextStyles.textStyle18,
                    ),
                    Text(
                      '${context.read<ProfileCubit>().myProfile!.profileInfo!.name}',
                      style: TextStyles.textStyle18
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                ],
              ),
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 0.0,
                        left: 10.0,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.of(context).yourEvents,
                                style: TextStyles.textStyle20
                                    .copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 8.0,
                            ),
                            BlocBuilder<HomeCubit, HomeState>(
                              builder: (context, state) {
                                return CarouselSlider(
                                  items: cubit.allEventImages.isEmpty
                                      ? cubit.shimmerEventLoading
                                      : cubit.allEventImages,
                                  options: CarouselOptions(
                                    viewportFraction: 0.96,
                                    initialPage: 0,
                                    autoPlayCurve: Curves.elasticInOut,
                                    scrollPhysics:
                                        const BouncingScrollPhysics(),
                                    height: MediaQuery.of(context).size.height *
                                        0.23,
                                    enableInfiniteScroll: false,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.8,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              S.of(context).yourProduct,
                                style: TextStyles.textStyle20
                                    .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FilterProductWidget(
                                  text: S.of(context).all,
                                  onTap: () {},
                                  textStyles: cubit.productView == 0
                                      ? TextStyles.textStyle14
                                      : TextStyles.textStyle14Primary,
                                  color: cubit.productView == 0
                                      ? ColorManager.primaryColor
                                      : ColorManager.originalWhite,
                                ),
                                FilterProductWidget(
                                  text: S.of(context).available,
                                  onTap: () {},
                                  textStyles: cubit.productView == 1
                                      ? TextStyles.textStyle14
                                      : TextStyles.textStyle14Primary,
                                  color: cubit.productView == 1
                                      ? ColorManager.primaryColor
                                      : ColorManager.originalWhite,
                                ),
                                FilterProductWidget(
                                  text: S.of(context).sold,
                                  onTap: () {},
                                  textStyles: cubit.productView == 2
                                      ? TextStyles.textStyle14
                                      : TextStyles.textStyle14Primary,
                                  color: cubit.productView == 2
                                      ? ColorManager.primaryColor
                                      : ColorManager.originalWhite,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                          ]),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: GetProductList(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
