import 'dart:io';

import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/constants/toast_color.dart';
import 'package:art_space_artist/features/products/data/models/add_product_response.dart';
import 'package:art_space_artist/features/products/data/models/add_product_to_event_request_body.dart';
import 'package:art_space_artist/features/products/data/models/add_product_to_event_response.dart';
import 'package:art_space_artist/features/products/data/models/get_category_response.dart';
import 'package:art_space_artist/features/products/data/models/get_styles_response.dart';
import 'package:art_space_artist/features/products/data/models/get_subject_response.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/get_product_details_response.dart';
import '../../data/repo/repo.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo _getMyProductsRepo;

  ProductsCubit(this._getMyProductsRepo) : super(const ProductsState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController depthController = TextEditingController();
  TextEditingController materialController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  File? coverImage;
  List<File> images = [];

  Future<void> getCoverImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    coverImage = file;
    emit(const ProductsState.addCoverPhotoProduct());
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

  void emitAddProduct() async {
    emit(const ProductsState.addProductLoading());
    FormData data = FormData.fromMap({
      'title': nameController.text,
      'description': descriptionController.text,
      'price': double.parse(priceController.text),
      'height': heightController.text,
      'width': widthController.text,
      'depth': depthController.text,
      'material': materialController.text,
      'category': categoryId,
      'subject': subjectId,
      'style': styleId,
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

    final response = await _getMyProductsRepo.addProduct(
      body: data,
    );
    response.when(
      success: (data) {
        emit(ProductsState.addProductSuccess(data));
      },
      failure: (error) {
        emit(ProductsState.addProductError(error: error));
      },
    );
  }

  ProductDetails? productDetails;

  void emitGetProductDetails({required String productId}) async {
    emit(const ProductsState.getProductDetailsLoading());
    final response = await _getMyProductsRepo.getProductDetails(
      productId: productId,
    );
    response.when(
      success: (data) {
        productDetails = data.productDetails;
        emit(ProductsState.getProductDetailsSuccess(data));
      },
      failure: (error) {
        emit(ProductsState.getProductDetailsError(error: error));
      },
    );
  }

  void emitDeleteProduct({required String productId}) async {
    emit(const ProductsState.deleteProductLoading());
    final response = await _getMyProductsRepo.deleteProduct(
      productId: productId,
    );
    response.when(
      success: (data) {
        emit(ProductsState.deleteProductSuccess(data));
      },
      failure: (error) {
        emit(ProductsState.deleteProductError(error: error));
      },
    );
  }

  List<StylesData>? styles;

  void emitGetStyles() async {
    emit(const ProductsState.getStylesLoading());
    final response = await _getMyProductsRepo.getStyles();
    response.when(
      success: (data) {
        styles = data.stylesData;
        getStylesSuccess = true;
        emit(ProductsState.getStylesSuccess(data));
      },
      failure: (error) {
        emit(ProductsState.getStylesError(error: error));
      },
    );
  }

  List<SubjectData>? subjects;

  void emitGetSubjects() async {
    emit(const ProductsState.getSubjectsLoading());
    final response = await _getMyProductsRepo.getSubject();
    response.when(
      success: (data) {
        subjects = data.subjectData;
        getSubjectsSuccess = true;
        emit(ProductsState.getSubjectsSuccess(data));
      },
      failure: (message) {
        emit(ProductsState.getSubjectsError(error: message));
      },
    );
  }

  List<CategoryData>? categories;

  void emitGetCategories() async {
    emit(const ProductsState.getCategoriesLoading());
    final response = await _getMyProductsRepo.getCategory();
    response.when(
      success: (data) {
        categories = data.categoryData;
        getCategoriesSuccess = true;
        emit(ProductsState.getCategoriesSuccess(data));
      },
      failure: (message) {
        emit(ProductsState.getCategoriesError(error: message));
      },
    );
  }

  void emitAddProductToEvent({required String eventId}) async {
    FormData data = FormData.fromMap({
      'title': nameController.text,
      'description': descriptionController.text,
      'price': double.parse(priceController.text),
      'height': heightController.text,
      'width': widthController.text,
      'depth': depthController.text,
      'material': materialController.text,
      'category': categoryId,
      'subject': subjectId,
      'style': styleId,
      'inEvent': true,
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

    final response = await _getMyProductsRepo.addProduct(
      body: data,
    );

    response.when(
      success: (AddProductResponse addProductResponse) async {
        final eventResponse = await _getMyProductsRepo.addProductToEvent(
          eventId: eventId,
          addProductToEventRequestBody: AddProductToEventRequestBody(
              productId: addProductResponse.data.id),
        );

        eventResponse.when(
            success: (AddProductToEventResponse addProductToEventResponse) {
          emit(ProductsState.addProductToEventSuccess(
              addProductToEventResponse));
        }, failure: (String error) {
          emit(ProductsState.addProductToEventError(error: error));
        });
      },
      failure: (String error) {
        emit(ProductsState.addProductToEventError(error: error));
      },
    );
  }

  void addProduct({String? eventId}) {
    if (formKey.currentState!.validate() && coverImage != null) {
      if (eventId != null) {
        emitAddProductToEvent(eventId: eventId);
      } else {
        emitAddProduct();
      }
    } else if (coverImage == null) {
      showToast(
        msg: "coverImage is required",
        state: ToastState.error,
      );
    }
  }
}
