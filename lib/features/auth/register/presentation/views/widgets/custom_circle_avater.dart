import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/features/auth/register/presentation/view_model/register_cubit.dart';
import 'package:art_space_artist/features/auth/register/presentation/view_model/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/constants/assets_manager.dart';

class CustomRegisterCircleAvatar extends StatelessWidget {
  const CustomRegisterCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<RegisterCubit>().pickImage(),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) => CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[300],
              child: context.read<RegisterCubit>().image == null
                  ? SvgPicture.asset(AssetsManager.registerAvatar)
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.file(
                        context.read<RegisterCubit>().image!,
                        height: 60.0,
                        width: 60.0,
                        fit: BoxFit.cover,
                      )),
            ),
          ),
          const CircleAvatar(
            radius: 11.5,
            backgroundColor: ColorManager.originalWhite,
            child: CircleAvatar(
              radius: 10.0,
              backgroundColor: ColorManager.primaryColor,
              child: Icon(
                Icons.add,
                color: ColorManager.originalWhite,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
