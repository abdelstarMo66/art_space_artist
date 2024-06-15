import 'dart:io';

import 'package:art_space_artist/features/auction/data/models/get_all_auction_response.dart';
import 'package:art_space_artist/features/auction/data/models/get_auction_details_response.dart';
import 'package:art_space_artist/features/auction/presentation/view_model/auction_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../../products/data/models/get_category_response.dart';
import '../../../products/data/models/get_styles_response.dart';
import '../../../products/data/models/get_subject_response.dart';
import '../../data/repo/repo.dart';

class AuctionCubit extends Cubit<AuctionState> {
  final AuctionRepo _auctionRepo;

  AuctionCubit(this._auctionRepo) : super(const AuctionState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController depthController = TextEditingController();
  TextEditingController materialController = TextEditingController();
  TextEditingController beganController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  File? coverImage;
  List<File> images = [];

  Future<void> getCoverImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    coverImage = file;
    emit(const AuctionState.initial());
  }

  Future<File> getImages() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    return file;
  }

  void deleteImage({required int index}) async {
    images.removeAt(index);
  }

  String? categoryId;
  String? styleId;
  String? subjectId;
  bool getCategoriesSuccess = false;
  bool getStylesSuccess = false;
  bool getSubjectsSuccess = false;

  void emitCreateAuction() async {
    emit(const AuctionState.createAuctionLoading());
    FormData data = FormData.fromMap({
      'title': nameController.text,
      'description': descriptionController.text,
      'finalPrice': double.parse(priceController.text),
      'height': heightController.text,
      'width': widthController.text,
      'depth': depthController.text,
      'material': materialController.text,
      'category': categoryId,
      'subject': subjectId,
      'style': styleId,
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

    if (images.isNotEmpty) {
      for (var image in images) {
        data.files.add(
          MapEntry(
            "images",
            await MultipartFile.fromFile(
              image.path,
              filename: image.path.split('/').last,
              contentType: MediaType("image", "*"),
            ),
          ),
        );
      }
    }

    final response = await _auctionRepo.createAuction(
      body: data,
    );
    response.when(
      success: (data) {
        emit(AuctionState.createAuctionSuccess(data));
      },
      failure: (error) {
        emit(AuctionState.createAuctionError(error: error));
      },
    );
  }

  List<StylesData>? styles;

  void emitGetStyles() async {
    emit(const AuctionState.getStylesLoading());
    final response = await _auctionRepo.getStyles();
    response.when(
      success: (data) {
        styles = data.stylesData;
        getStylesSuccess = true;
        emit(AuctionState.getStylesSuccess(data));
      },
      failure: (error) {
        emit(AuctionState.getStylesError(error: error));
      },
    );
  }

  List<SubjectData>? subjects;

  void emitGetSubjects() async {
    emit(const AuctionState.getSubjectsLoading());
    final response = await _auctionRepo.getSubject();
    response.when(
      success: (data) {
        subjects = data.subjectData;
        getSubjectsSuccess = true;
        emit(AuctionState.getSubjectsSuccess(data));
      },
      failure: (message) {
        emit(AuctionState.getSubjectsError(error: message));
      },
    );
  }

  List<CategoryData>? categories;

  void emitGetCategories() async {
    emit(const AuctionState.getCategoriesLoading());
    final response = await _auctionRepo.getCategory();
    response.when(
      success: (data) {
        categories = data.categoryData;
        getCategoriesSuccess = true;
        emit(AuctionState.getCategoriesSuccess(data));
      },
      failure: (message) {
        emit(AuctionState.getCategoriesError(error: message));
      },
    );
  }

  void createAuction() {
    if (formKey.currentState!.validate()) {
      emitCreateAuction();
    }
  }

  List<AuctionsInformations> myAuctions = [];

  void emitGetAllAuctions() async {
    emit(const AuctionState.getAllAuctionsLoading());
    final response = await _auctionRepo.getAllAuction();
    response.when(
        success: (data) {
      for (AuctionsInformations auctions in data.auctions.actionsInfo) {
        myAuctions.add(auctions);
      }
      emit(AuctionState.getAllAuctionsSuccess(data));
    }, failure: (error) {
      emit(AuctionState.getAllAuctionsError(error: error));
    });
  }


  AuctionInfo ?auctionInfo;

  void emitGetDetailsAuction({required String auctionId}) async {
    emit(const AuctionState.getAuctionDetailsLoading());
    final response = await _auctionRepo.getAuctionDetails(
        auctionId: auctionId);
    response.when(
      success: (data) {
        auctionInfo = data.auctionInfo;
        emit(AuctionState.getAuctionDetailsSuccess(data));
      },
      failure: (error) {
        emit(AuctionState.getAuctionDetailsError(error: error));
      },
    );
  }
}