import 'package:art_space_artist/core/components/loading_widget.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/di/dependency_injection.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                centerTitle: true,
                title: Text(
                  "${S.of(context).welcome} ${context.read<ProfileCubit>().myProfile!.profileInfo!.name!.split(" ")[0]}",
                  style: TextStyles.textStyle18.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: ColorManager.primaryColor,
                                    width: 5.0,
                                  ),
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                ),
                              ),
                              child: Text(
                                'Your exhibitions',
                                style: TextStyles.textStyle24
                                    .copyWith(color: ColorManager.originalBlack),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            BlocBuilder<HomeCubit, HomeState>(
                              builder: (context, state) {
                                if(state is GetHomeEventSuccess && cubit.allEvents.isEmpty)
                                  {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 23.0),
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Text('No events created !!', style: TextStyles.textStyle18,),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            TextButton(child:  Text('Create your first event', style: TextStyles.textStyle18.copyWith(
                                              color: ColorManager.primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),), onPressed: () {
                                              Navigator.of(context).pushNamed(AppRouterNames.createEvent);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
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
                                    // height: 225.0,
                                    enableInfiniteScroll: false,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.8,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 22.0,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: ColorManager.primaryColor,
                                    width: 5.0,
                                  ),
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                ),
                              ),
                              child: Text(
                                'Your artworks',
                                style: TextStyles.textStyle24
                                    .copyWith(color: ColorManager.originalBlack),
                              ),
                            ),
                            // const SizedBox(
                            //   height: 15.0,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //   children: [
                            //     FilterProductWidget(
                            //       text: S.of(context).available,
                            //       onTap: () {
                            //         setState(() {
                            //           cubit.available = true;
                            //         });
                            //       },
                            //       textStyles: cubit.available == true
                            //           ? TextStyles.textStyle14
                            //           : TextStyles.textStyle14Primary,
                            //       color: cubit.available == true
                            //           ? ColorManager.primaryColor
                            //           : ColorManager.originalWhite,
                            //     ),
                            //     FilterProductWidget(
                            //       text: S.of(context).sold,
                            //       onTap: () {
                            //         setState(() {
                            //           cubit.available = false;
                            //         });
                            //       },
                            //       textStyles: cubit.available == false
                            //           ? TextStyles.textStyle14
                            //           : TextStyles.textStyle14Primary,
                            //       color: cubit.available == false
                            //           ? ColorManager.primaryColor
                            //           : ColorManager.originalWhite,
                            //     ),
                            //   ],
                            // ),
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
