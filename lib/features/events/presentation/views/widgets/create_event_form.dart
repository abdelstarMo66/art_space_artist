import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/create_text_form.dart';
import '../../../../../core/constants/color_manager.dart';
import '../../../../../core/constants/text_style.dart';
import '../../view_model/event_cubit.dart';

class CreateEventForm extends StatelessWidget {
  const CreateEventForm({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<EventCubit>();
    return  Form(
      key: cubit.createEventFormKey,
      child: Column(
        children: [
          CreateTextForm(
            text: 'Title',
            controller: cubit.titleController,
            validator: (value) {
              if(value == null || value.isEmpty)
              {
                return 'Please enter title';
              }
              return null;
            },
            keyboardType: TextInputType.name,
            textAlign: TextAlign.start,
            padding: 15,
          ),
          const SizedBox(
              height: 20.0
          ),
          CreateTextForm(
            text: 'Description',
            controller: cubit.descriptionController,
            validator: (value) {
              if(value == null || value.isEmpty)
              {
                return 'Please enter description';
              }
              return null;
            },
            keyboardType: TextInputType.name,
            textAlign: TextAlign.start,
            padding: 15,
          ),
          const SizedBox(
              height: 20.0
          ),
          CreateTextForm(
            onTap: () {
              // SfDateRangePicker(
              //   minDate: DateTime.now(),
              //   startRangeSelectionColor: ColorManager.secondaryColor,
              //   rangeSelectionColor: ColorManager.primaryColor,
              //   endRangeSelectionColor: ColorManager.secondaryColor,
              //   selectionColor: ColorManager.primaryColor,
              //   todayHighlightColor: ColorManager.originalBlack,
              //   view: DateRangePickerView.month,
              //   selectionMode: DateRangePickerSelectionMode.range,
              //   showActionButtons: true,
              //   showTodayButton: true,
              //   onSelectionChanged: (value){},
              //   onSubmit: (value){
              //     print(value);
              //   },
              //   onCancel: (){},
              //   selectionTextStyle: TextStyles.textStyle14Primary.copyWith(decoration: TextDecoration.none),
              //   confirmText: 'Confirm',
              //   cancelText: 'cancel',
              // );
            },
            text: 'Began date',
            controller: cubit.beganController,
            validator: (value) {
              if(value == null || value.isEmpty)
              {
                return 'Please enter began date';
              }
              return null;
            },
            keyboardType: TextInputType.name,
            textAlign: TextAlign.start,
            padding: 15,
          ),
          const SizedBox(
              height: 20.0
          ),
          CreateTextForm(
            text: 'Duration',
            controller: cubit.durationController,
            validator: (value) {
              if(value == null || value.isEmpty)
              {
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
        ],
      ),
    );
  }
}
