import 'package:art_space_artist/core/components/loading_widget.dart';
import 'package:art_space_artist/core/constants/color_manager.dart';
import 'package:art_space_artist/core/constants/const_method.dart';
import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/events/presentation/view_model/event_cubit.dart';
import 'package:art_space_artist/features/events/presentation/view_model/event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditEventListener extends StatelessWidget {
  const EditEventListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EventCubit, EventState>(
      listenWhen: (previous, current) =>
      current is EditEventLoading ||
          current is EditEventSuccess ||
          current is EditEventError,
      listener: (context, state) {
        state.whenOrNull(
          editEventLoading: () {
            showDialog(
                context: context, builder: (context) => const Center(child:
              CircularProgressIndicator(
                backgroundColor: ColorManager.primaryColor,
              ),));
          },
          editEventSuccess: (data) {
            Navigator.of(context).pop();
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRouterNames.home, (route) => false);
          },
          editEventError: (message) {
            Navigator.of(context).pop();
            showToast(message.toString(), ToastState.error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
