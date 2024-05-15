import 'package:art_space_artist/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/components/default_text_field.dart';
import '../../../../../../core/constants/text_style.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProfileCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Name', style: TextStyles.textStyle18,),
        const SizedBox(height: 10.0,),
        DefaultTextField(
            controller: cubit.nameController,
            hintText: '${cubit.myProfile!.profileInfo!.name}',
            validator: (value) {},
            keyboardType: TextInputType.name,
            obscureText: false,
            maxLines: 1,
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text('Bio', style: TextStyles.textStyle18,),
        const SizedBox(height: 10.0,),
        DefaultTextField(
            controller: cubit.bioController,
            hintText: '${cubit.myProfile!.profileInfo!.bio}',
            validator: (value) {},
            keyboardType: TextInputType.name,
            obscureText: false,
            maxLines: 1),
        const SizedBox(
          height: 10.0,
        ),
        const Text('Phone', style: TextStyles.textStyle18,),
        const SizedBox(height: 10.0,),
        DefaultTextField(
            controller: cubit.phoneController,
            hintText: '${cubit.myProfile!.profileInfo!.phone}',
            validator: (value) {},
            keyboardType: TextInputType.name,
            obscureText: false,
            maxLines: 1),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
