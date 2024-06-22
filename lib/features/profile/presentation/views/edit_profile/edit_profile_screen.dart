import 'package:art_space_artist/core/components/default_button.dart';
import 'package:art_space_artist/core/components/loading_widget.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/constants/toast_color.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/profile_state.dart';
import 'package:art_space_artist/features/profile/presentation/views/edit_profile/widgets/cahnge_password_widget.dart';
import 'package:art_space_artist/features/profile/presentation/views/edit_profile/widgets/edit_profile_app_bar.dart';
import 'package:art_space_artist/features/profile/presentation/views/edit_profile/widgets/edit_profile_form.dart';
import 'package:art_space_artist/features/profile/presentation/views/edit_profile/widgets/image_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/router/app_router_names.dart';


class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
        return BlocConsumer<ProfileCubit, ProfileState>(
          listenWhen: (previous, current) => current is EditProfileSuccess ||
              current is EditProfileError ||
              current is EditProfileLoading,
          listener: (context, state) {
            state.whenOrNull(
              editProfileLoading: () {
                showDialog(
                  context: context,
                  builder: (context) => const Center(child: CircularProgressIndicator(
                  backgroundColor: ColorManager.primaryColor,
                ),),);
              },
              editProfileSuccess: (data) {
                Navigator.of(context).pop();
                showToast(msg: 'Profile edited successfully', state: ToastState.success);
                Navigator.of(context).pushNamedAndRemoveUntil(AppRouterNames.home, (route) => false,);
              },
              editProfileError: (error) {
                Navigator.of(context).pop();
                showToast(msg: error, state: ToastState.error);
              },
            );
          },
            builder: (context, state) {
            if(state is GetProfileLoading)
              {
                return const LoadingWidget();
              }
              if(context.read<ProfileCubit>().myProfile != null)
                {
                  return Scaffold(
                    backgroundColor: ColorManager.primaryColor,
                    body: ListView(
                        children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      const EditProfileAppBar(),
                      const SizedBox(
                        height: 25.0,
                      ),
                      const EditProfileImage(),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 25.0, right: 10.0, left: 10.0),
                         height: MediaQuery.of(context).size.height * 0.659,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: ColorManager.originalWhite,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                        ),
                        child: Column(
                          children: [
                            const EditProfileForm(),
                            const ChangePasswordWidget(),
                            const SizedBox(
                              height: 20.0,
                            ),
                            DefaultButton(
                              text: state is EditProfileLoading ? 'saving' : 'save',
                              onPressed: () {
                                context.read<ProfileCubit>().emitUpdateProfile();
                                if(state is EditProfileSuccess) {
                                  Navigator.of(context).pop();
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ]),
                  );
                } else {
                return const LoadingWidget();
              }
            },);
  }
}
