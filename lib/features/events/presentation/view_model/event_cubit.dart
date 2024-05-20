import 'dart:io';

import 'package:art_space_artist/features/events/data/repo/repo.dart';
import 'package:art_space_artist/features/events/presentation/view_model/event_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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
      failure: (error) {
        print(error);
        emit(EventState.createEventFailure(error));
      },
    );
  }
}
