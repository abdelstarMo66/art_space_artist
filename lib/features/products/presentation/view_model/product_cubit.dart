import 'dart:io';

import 'package:art_space_artist/core/constants/constants.dart';
import 'package:art_space_artist/core/constants/toast_color.dart';
import 'package:art_space_artist/core/network/api_error_handler.dart';
import 'package:art_space_artist/features/products/data/models/add_product_response.dart';
import 'package:art_space_artist/features/products/data/models/add_product_to_event_request_body.dart';
import 'package:art_space_artist/features/products/data/models/add_product_to_event_response.dart';
import 'package:art_space_artist/features/products/data/models/delete_specific_image_request_body.dart';
import 'package:art_space_artist/features/products/data/models/edit_product_request_body.dart';
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
  final ProductsRepo _productsRepo;

  ProductsCubit(this._productsRepo) : super(const ProductsState.initial());

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

    final response = await _productsRepo.addProduct(
      body: data,
    );
    response.when(
      success: (data) {
        emit(ProductsState.addProductSuccess(data));
      },
      failure: (ErrorHandler error) {
        emit(ProductsState.addProductError(error: error.apiErrorModel.message));
      },
    );
  }

  ProductDetails? productDetails;

  void emitGetProductDetails({required String productId}) async {
    emit(const ProductsState.getProductDetailsLoading());
    final response = await _productsRepo.getProductDetails(
      productId: productId,
    );
    response.when(
      success: (data) {
        productDetails = data.productDetails;
        emit(ProductsState.getProductDetailsSuccess(data));
      },
      failure: (ErrorHandler error) {
        emit(ProductsState.getProductDetailsError(error: error.apiErrorModel.message));
      },
    );
  }

  void emitDeleteProduct({required String productId}) async {
    emit(const ProductsState.deleteProductLoading());
    final response = await _productsRepo.deleteProduct(
      productId: productId,
    );
    response.when(
      success: (data) {
        emit(ProductsState.deleteProductSuccess(data));
      },
      failure: (ErrorHandler error) {
        emit(ProductsState.deleteProductError(error: error.apiErrorModel.message));
      },
    );
  }

  List<StylesData>? styles;

  void emitGetStyles() async {
    emit(const ProductsState.getStylesLoading());
    final response = await _productsRepo.getStyles();
    response.when(
      success: (data) {
        styles = data.stylesData;
        getStylesSuccess = true;
        emit(ProductsState.getStylesSuccess(data));
      },
      failure: (ErrorHandler error) {
        emit(ProductsState.getStylesError(error: error.apiErrorModel.message));
      },
    );
  }

  List<SubjectData>? subjects;

  void emitGetSubjects() async {
    emit(const ProductsState.getSubjectsLoading());
    final response = await _productsRepo.getSubject();
    response.when(
      success: (data) {
        subjects = data.subjectData;
        getSubjectsSuccess = true;
        emit(ProductsState.getSubjectsSuccess(data));
      },
      failure: (ErrorHandler error) {
        emit(ProductsState.getSubjectsError(error: error.apiErrorModel.message));
      },
    );
  }

  List<CategoryData>? categories;

  void emitGetCategories() async {
    emit(const ProductsState.getCategoriesLoading());
    final response = await _productsRepo.getCategory();
    response.when(
      success: (data) {
        categories = data.categoryData;
        getCategoriesSuccess = true;
        emit(ProductsState.getCategoriesSuccess(data));
      },
      failure: (ErrorHandler error) {
        emit(ProductsState.getCategoriesError(error: error.apiErrorModel.message));
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

    final response = await _productsRepo.addProduct(
      body: data,
    );

    response.when(
      success: (AddProductResponse addProductResponse) async {
        final eventResponse = await _productsRepo.addProductToEvent(
          eventId: eventId,
          addProductToEventRequestBody: AddProductToEventRequestBody(
              productId: addProductResponse.data.id),
        );

        eventResponse.when(
            success: (AddProductToEventResponse addProductToEventResponse) {
          emit(ProductsState.addProductToEventSuccess(
              addProductToEventResponse));
        }, failure: (ErrorHandler error) {
          emit(ProductsState.addProductToEventError(error: error.apiErrorModel.message));
        });
      },
      failure: (ErrorHandler error) {
        emit(ProductsState.addProductToEventError(error: error.apiErrorModel.message));
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

  void emitEditProduct({
    required String id,
    required String title,
    required String description,
    required String price,
    required String height,
    required String weight,
    required String depth,
}) async {
    emit(const ProductsState.editProductLoading());
    final response = await _productsRepo.editProduct(
        productId: id,
        editProductRequestBody: EditProductRequestBody(
            title: title,
            description: description,
            price: price,
            height: height,
            weight: weight,
            depth: depth
        )
    );
    response.when(
      success: (data) {
        print(data.message);
        emit(ProductsState.editProductSuccess(data));
    },
      failure: (ErrorHandler error) {
        emit(ProductsState.editProductError(error: error.apiErrorModel.message));
      },
    );
  }

  void emitDeleteSpecificImage({
    required String productId,
    required String imageId,
  }) async {
    emit(const ProductsState.deleteSpecificImageLoading());
    final response = await _productsRepo.deleteSpecificImage(
      productId: productId,
      deleteSpecificImageRequestBody: DeleteSpecificImageRequestBody(publicId: imageId),
    );
    response.when(
      success: (data) {
        emit(ProductsState.deleteProductSuccess(data));
      },
      failure: (ErrorHandler error) {
        emit(ProductsState.deleteProductError(error: error.apiErrorModel.message));
      },
    );
  }
}
