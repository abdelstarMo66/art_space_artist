import 'dart:io';
import 'package:art_space_artist/core/network/api_error_handler.dart';
import 'package:art_space_artist/features/events/data/model/edit_event_request_body.dart';
import 'package:art_space_artist/features/events/data/model/get_event_details_response.dart';
import 'package:art_space_artist/features/events/data/repo/repo.dart';
import 'package:art_space_artist/features/events/presentation/view_model/event_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class EventCubit extends Cubit<EventState> {
  final EventRepo _eventRepo;

  EventCubit(this._eventRepo) : super(const EventState.initial());

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController beganController = TextEditingController();
  TextEditingController endController = TextEditingController(text: 'end');

  final createEventFormKey = GlobalKey<FormState>();

  File? coverImage;

  Future<void> getCoverImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    coverImage = file;
    emit(const EventState.addEventCoverImage());
  }
  void emitCreateEvent() async {
    emit(const EventState.createEventLoading());
    FormData data = FormData.fromMap({
      'title': titleController.text,
      'description': descriptionController.text,
      'duration' : durationController.text,
      'began' : beganController.text,
    });

    data.files.add(
      MapEntry(
        "coverImage",
        await MultipartFile.fromFile(
          coverImage!.path,
          filename: coverImage!.path.split('/').last,
          contentType: MediaType("image", "*"),
        ),
      ),
    );

    final response = await _eventRepo.createEvent(
      requestBody: data,
    );
    response.when(
      success: (data) {
        print('Ba3at data ya sa7bi');
        emit(EventState.createEventSuccess(data));
      },
      failure: (ErrorHandler error) {
        emit(EventState.createEventFailure(error.apiErrorModel.message));
      },
    );
  }

  EventInfo? eventInfo;
  void emitGetEventDetails({required String eventId}) async {
    emit(const EventState.getEventDetailsLoading());
    final response = await _eventRepo.getEventDetails(eventId: eventId);
    response.when(
      success: (data) {
        eventInfo = data.eventInfo;
        emit(EventState.getEventDetailsSuccess(data));
      },
      failure: (ErrorHandler error) {
        emit(EventState.getEventDetailsFailure(error.apiErrorModel.message));
      },
    );
  }
  Future<void> selectDate({required BuildContext context}) async {
    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2020),
        initialDate: DateTime.now(),
        lastDate: DateTime(2030));

    if(picked != null) {
      beganController.text = picked.toString().split(" ")[0];
    }
  }

  Future<void> deleteEvent() async {
    emit(const EventState.deleteEventLoading());

    final response = await _eventRepo.deleteEvent(
      eventId: eventInfo!.id,
    );
    response.when(
      success: (data) {
        emit(EventState.deleteEventSuccess(data));
      },
      failure: (error) {
        emit(EventState.deleteEventError(error.toString()));
      },
    );
  }
  TextEditingController editTitleController = TextEditingController();
  TextEditingController editDescriptionController = TextEditingController();
  TextEditingController editBeganController = TextEditingController();
  TextEditingController editDurationController = TextEditingController();

  Future<void> emitEditEvent({
    required EditEventRequestBody editEventRequestBody,
    required String eventId,
}) async {
    emit(const EventState.editEventLoading());

    final response = await _eventRepo.editEvent(
        eventId: eventInfo!.id,
        editEventRequestBody: editEventRequestBody
    );
    response.when(
      success: (data) {
        emit(EventState.editEventSuccess(data));
      },
    failure: (ErrorHandler error) {
        emit(EventState.editEventError(error.apiErrorModel.message));
  },
    );
}
}
