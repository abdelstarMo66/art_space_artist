import 'dart:io';
import 'package:art_space_artist/features/products/data/models/get_category_response.dart';
import 'package:art_space_artist/features/products/data/models/get_my_products_response.dart';
import 'package:art_space_artist/features/products/data/models/get_subject_response.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import '../../data/models/get_product_details_response.dart';
import '../../data/repo/repo.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo _getMyProductsRepo;

  ProductsCubit(this._getMyProductsRepo) : super(const ProductsState.initial());

  List<ProductsInfo>? myProducts;

  void emitGetMyProducts() async {
    emit(const ProductsState.getProductLoading());
    final response = await _getMyProductsRepo.getMyProducts();
    response.when(success: (data) {
      myProducts = data.products!.productsInfo;
      emit(ProductsState.addProductSuccess(data));
    }, failure: (error) {
      emit(ProductsState.getProductError(error: error));
    });
  }

  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var priceController = TextEditingController();
  var heightController = TextEditingController();
  var widthController = TextEditingController();
  var depthController = TextEditingController();
  var materialController = TextEditingController();

  late File coverImage;

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    coverImage = file;
  }

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
      'category': '658dc953fb8a9862b9b3503b',
      'subject': '65a2ada7726b48afe615eb98',
      'style': '65ee850805797cb7c787bc5b',
    });

    data.files.add(
      MapEntry(
        "coverImage",
        await MultipartFile.fromFile(
          coverImage.path,
          filename: coverImage.path.split('/').last,
          contentType: MediaType("image", "*"),
        ),
      ),
    );

    final response = await _getMyProductsRepo.addProduct(
      body: data,
    );
    response.when(
      success: (data) {
        print('Ba3at data ya sa7bi');
        emit(ProductsState.addProductSuccess(data));
      },
      failure: (error) {
        print(error);
        emit(ProductsState.addProductError(error: error));
      },
    );
  }

  ProductDetails ?productDetails;
  void emitGetProductDetails({required int index}) async {
    emit(const ProductsState.getProductDetailsLoading());
    print(myProducts![index].id);
    final response = await _getMyProductsRepo.getProductDetails(
      productId: "${myProducts![index].id}",
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

  List ?styles;
  void emitDeleteProduct({required int index}) async {
    emit(const ProductsState.deleteProductLoading());
    final response = await _getMyProductsRepo.deleteProduct(
      productId: "${myProducts![index].id}",
    );
    response.when(
      success: (data) {
        myProducts!.removeAt(index);
        emit(ProductsState.deleteProductSuccess(data));
      },
      failure: (error) {
        emit(ProductsState.deleteProductError(error: error));
      },
    );
  }

  void emitGetStyles() async {
    emit(const ProductsState.getStylesLoading());
    final response = await _getMyProductsRepo.getStyles();
    response.when(
      success: (data) {
        styles = data.stylesData;
        print(styles);
        emit(ProductsState.getStylesSuccess(data));
      },
      failure: (error) {
        emit(ProductsState.getStylesError(error: error));
      },
    );
  }

  List<SubjectData> ?subjects;
  void emitGetSubjects() async {
    emit(const ProductsState.getSubjectsLoading());
    final response = await _getMyProductsRepo.getSubject();
    response.when(
        success: (data) {
          subjects = data.subjectData;
          print(subjects);
          emit(ProductsState.getSubjectsSuccess(data));
        },
        failure: (message) {
         emit(ProductsState.getSubjectsError(error: message));
         print(message);
        },
    );
  }

  List<CategoryData> ?categories;
  void emitGetCategories() async {
    emit(const ProductsState.getCategoriesLoading());
    final response = await _getMyProductsRepo.getCategory();
    response.when(
        success: (data) {
          categories = data.categoryData;
          print(categories);
          emit(ProductsState.getCategoriesSuccess(data));
        },
        failure: (message) {
          emit(ProductsState.getCategoriesError(error: message));
          print(message);
        },
    );
  }
}
