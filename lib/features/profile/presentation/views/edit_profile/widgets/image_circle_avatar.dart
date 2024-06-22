import 'package:art_space_artist/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/constants/assets_manager.dart';
import '../../../../../../core/constants/color_manager.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
              backgroundColor: ColorManager.originalWhite,
              radius: 60.0,
              child:
                  context.read<ProfileCubit>().myProfile!.profileInfo!.profileImg ==
                          null
                      ? CircleAvatar(
                          backgroundColor: ColorManager.darkGray,
                          radius: 55,
                          child: Align(
                              alignment: AlignmentDirectional.bottomCenter,
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(48),
                                  child: Image.asset(
                                    AssetsManager.imgMaleProfile,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ))),
                        )
                      : CircleAvatar(
                    radius: 55,
                          backgroundImage: NetworkImage(
                                '${context.read<ProfileCubit>().myProfile!.profileInfo!.profileImg}'),
                        )),
          InkWell(
            onTap: () {
              print('dsfffd');
            },
            child: CircleAvatar(
              backgroundColor: ColorManager.lightGray,
              radius: 18,
              child: SvgPicture.asset(
                AssetsManager.icEdit,
                height: 30,
                colorFilter: const ColorFilter.mode(
                    ColorManager.secondaryColor, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
