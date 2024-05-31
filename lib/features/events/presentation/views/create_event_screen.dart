import 'package:art_space_artist/core/components/default_button.dart';
import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/core/router/app_router_names.dart';
import 'package:art_space_artist/features/events/presentation/view_model/event_cubit.dart';
import 'package:art_space_artist/features/events/presentation/views/widgets/create_event_form.dart';
import 'package:art_space_artist/features/events/presentation/views/widgets/create_event_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/text_style.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<EventCubit>();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 44.0,
        leading: GestureDetector(
            onTap: () =>
                Navigator.of(context).pop(),
            child: SvgPicture.asset(AssetsManager.icBackArrow)),
        title: const Text('Create Event'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          Center(
            child: GestureDetector(
              onTap: () => cubit.getCoverImage(),
              child: Container(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(25),
                    border: Border.all(
                      color: Colors.green,
                    )),
                child: cubit.coverImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadiusDirectional.circular(25),
                        child: Image.file(
                          cubit.coverImage!,
                          fit: BoxFit.cover,
                          height: 200,
                          width: 400,
                        ))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetsManager.icImage,
                            height: 110,
                            colorFilter: const ColorFilter.mode(
                                Colors.green, BlendMode.srcIn
                            ),
                          ),
                          const Text(
                            'Tap here to add cover',
                            style: TextStyles.textStyle18,
                          ),
                        ],
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          const CreateEventForm(),
          DefaultButton(
            text: 'Create',
            onPressed: () {
              if (cubit.createEventFormKey.currentState!.validate()) {
                cubit.emitCreateEvent();
              }
            },
          ),
          const CreateEventListener()
        ],
      ),
    );
  }
}
