import 'package:art_space_artist/core/components/loading_widget.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/di/dependency_injection.dart';
import 'package:art_space_artist/features/home/presentation/view_model/home_cubit.dart';
import 'package:art_space_artist/features/home/presentation/views/widget/get_product_list.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_cubit.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/get_profile_state.dart';
import 'package:art_space_artist/features/profile/presentation/views/profile_drawer_widget.dart';
import 'package:art_space_artist/features/home/presentation/views/widget/filter_product_widget.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/get_profile_cubit.dart';
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
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => getIt<GetProfileCubit>()..emitGetProfileStates(),
        ),
        BlocProvider(
          create: (context) => getIt<ProductsCubit>()
            ..emitGetMyProducts()
            ..emitGetStyles()
            ..emitGetSubjects()
            ..emitGetCategories(),
        ),
      ],
      child: BlocBuilder<GetProfileCubit, GetProfileState>(
        builder: (context, state) {
          if (state is Loading) {
            return const LoadingWidget();
          } else {
            var cubit = HomeCubit.get(context);
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
                      '${context.read<GetProfileCubit>().myProfile!.profileInfo!.name}',
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
                                style: TextStyles.textStyle26),
                            const SizedBox(
                              height: 15.0,
                            ),
                            CarouselSlider(
                              items: cubit.images,
                              options: CarouselOptions(
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                initialPage: 0,
                                height:
                                    MediaQuery.of(context).size.height * 0.23,
                                autoPlay: false,
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              S.of(context).yourProduct,
                              style: TextStyles.textStyle26,
                            ), // ToDo localization
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FilterProductWidget(
                                  text: S.of(context).all,
                                  onTap: () {
                                    cubit.changeProductView(viewNum: 0);
                                  },
                                  textStyles: cubit.productView == 0
                                      ? TextStyles.textStyle14
                                      : TextStyles.textStyle14Primary,
                                  color: cubit.productView == 0
                                      ? ColorManager.primaryColor
                                      : ColorManager.originalWhite,
                                ),
                                FilterProductWidget(
                                  text: S.of(context).available,
                                  onTap: () {
                                    cubit.changeProductView(viewNum: 1);
                                  },
                                  textStyles: cubit.productView == 1
                                      ? TextStyles.textStyle14
                                      : TextStyles.textStyle14Primary,
                                  color: cubit.productView == 1
                                      ? ColorManager.primaryColor
                                      : ColorManager.originalWhite,
                                ),
                                FilterProductWidget(
                                  text: S.of(context).sold,
                                  onTap: () {
                                    cubit.changeProductView(viewNum: 2);
                                  },
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
                              height: 20.0,
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
