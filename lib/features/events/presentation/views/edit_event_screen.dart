import 'package:art_space_artist/core/components/default_button.dart';
import 'package:art_space_artist/core/constants/assets_manager.dart';
import 'package:art_space_artist/features/events/data/model/edit_event_request_body.dart';
import 'package:art_space_artist/features/events/data/model/get_event_details_response.dart';
import 'package:art_space_artist/features/events/presentation/view_model/event_cubit.dart';
import 'package:art_space_artist/features/events/presentation/views/widgets/edit_event_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/components/create_text_form.dart';

class EditEventScreen extends StatelessWidget {
  final EventInfo eventInfo;
  const EditEventScreen({super.key, required this.eventInfo});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<EventCubit>();
    TextEditingController descriptionController = TextEditingController(text: eventInfo.description);
        TextEditingController beganController = TextEditingController(text: eventInfo.began.split("T")[0]);
        TextEditingController titleController = TextEditingController(text: eventInfo.title);
        TextEditingController durationController = TextEditingController(text: eventInfo.duration.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit event'),
        leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: SvgPicture.asset(AssetsManager.icBackArrow),),
        leadingWidth: 35.0,
      ),
      body: Form(
        key: cubit.createEventFormKey,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            CreateTextForm(
              text: 'Title',
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter title';
                }
                return null;
              },
              keyboardType: TextInputType.name,
              textAlign: TextAlign.start,
              padding: 15,
            ),
            const SizedBox(height: 20.0),
            CreateTextForm(
              text: 'Description',
              controller: descriptionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter description';
                }
                return null;
              },
              keyboardType: TextInputType.name,
              textAlign: TextAlign.start,
              padding: 15,
            ),
            const SizedBox(height: 20.0),
            CreateTextForm(
              readOnly: true,
              onTap: () => cubit.selectDate(context: context),
              text: 'Began date',
              controller: beganController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter began date';
                }
                return null;
              },
              keyboardType: TextInputType.name,
              textAlign: TextAlign.start,
              padding: 15,
            ),
            const SizedBox(height: 20.0),
            CreateTextForm(
              text: 'Duration',
              controller: durationController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the duration';
                }
                return null;
              },
              keyboardType: TextInputType.datetime,
              textAlign: TextAlign.start,
              padding: 15,
            ),
            const SizedBox(
              height: 50.0,
            ),
            DefaultButton(
                text: 'Save', onPressed: () {
                  print(eventInfo.id);
                  if(cubit.createEventFormKey.currentState!.validate()) {
                    cubit.emitEditEvent(
                      eventId: eventInfo.id,
                      editEventRequestBody: EditEventRequestBody(
                        title: titleController.text,
                        description: descriptionController.text,
                        duration: durationController.hashCode,
                        began: beganController.text)
                  );
                  }
            }),
            const EditEventListener(),
          ],
        ),
      ),
    );
  }
}
