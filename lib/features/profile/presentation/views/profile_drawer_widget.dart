import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/text_style.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../generated/l10n.dart';

class CustomProfileDrawer extends StatelessWidget {
  const CustomProfileDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = context.read<ProfileCubit>();
        if (cubit.myProfile != null) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  padding:
                      const EdgeInsetsDirectional.only(top: 50.0, start: 15.0),
                  height: 190,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          ColorManager.thirdColor,
                          ColorManager.primaryColor,
                          ColorManager.secondaryColor,
                        ]),
                    borderRadius: BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(40),
                      bottomEnd: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              backgroundColor: ColorManager.originalWhite,
                              radius: 36.0,
                              child: context
                                          .read<ProfileCubit>()
                                          .myProfile!
                                          .profileInfo!
                                          .profileImg ==
                                      null
                                  ? CircleAvatar(
                                      backgroundColor: ColorManager.darkGray,
                                      radius: 34,
                                      child: Align(
                                          alignment: AlignmentDirectional
                                              .bottomCenter,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(48),
                                              child: Image.asset(
                                                AssetsManager.imgMaleProfile,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ))),
                                    )
                                  : CircleAvatar(
                                      radius: 34,
                                      backgroundImage:  NetworkImage(
                                            '${context.read<ProfileCubit>().myProfile!.profileInfo!.profileImg}',
                                        ),
                                    )),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${cubit.myProfile!.profileInfo!.name}',
                                  style: TextStyles.textStyle21.copyWith(
                                      color: ColorManager.originalWhite),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  '${cubit.myProfile!.profileInfo!.email}',
                                  style: TextStyles.textStyle12
                                      .copyWith(color: ColorManager.gray),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.012,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(AppRouterNames.editProfile);
                              },
                              child: SvgPicture.asset(
                                AssetsManager.icDownArrow,
                                height: 40,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AppRouterNames.createEvent,);
                  },
                  leading: SvgPicture.asset(
                    AssetsManager.icVr,
                    height: 40,
                  ),
                  title: Text(
                    S.of(context).createEvent,
                    style: TextStyles.textStyle18,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AppRouterNames.createProduct);
                  },
                  leading: SvgPicture.asset(
                    AssetsManager.icAdd,
                    height: 40,
                  ),
                  title: Text(
                    S.of(context).addProduct,
                    style: TextStyles.textStyle18,
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.of(context)
                      .pushNamed(AppRouterNames.allAuctions),
                  leading: SvgPicture.asset(
                    AssetsManager.icAuction,
                    height: 35,
                  ),
                  title: const Text(
                    'Auctions',
                    style: TextStyles.textStyle18,
                  ),
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    AssetsManager.icSettings,
                    height: 40,
                  ),
                  title: Text(
                    S.of(context).settings,
                    style: TextStyles.textStyle18,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.3,),
                GestureDetector(
                  onTap: () => cubit.emitLogout(context: context),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      AssetsManager.icLogOut,
                      height: 40,
                      colorFilter: const ColorFilter.mode(ColorManager.primaryColor, BlendMode.srcIn),
                    ),
                    title: Text(
                      S.of(context).logOut,
                      style: TextStyles.textStyle18.copyWith(color: ColorManager.primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Drawer(
            child: Text('Not found data',),
          );
        }
      },
    );
  }
}
