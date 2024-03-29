import 'dart:io';

import 'package:art_space_artist/features/products/data/models/get_my_products_response.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

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

  List<String> styles = [
    'Dark',
    'Light',
  ];

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
      'title': "fdslhglkgjfdshg",
      'description':
          "fdslhglkgjfdshgfdslhglkgjfdshgfdslhglkgjfdshgfdslhglkgjfdshgfdslhglkgjfdshgfdslhglkgjfdshgfdslhglkgjfdshgfdslhglkgjfdshgfdslhglkgjfdshgfdslhglkgjfdshg",
      'price': 500.0,
      'height': 150.0,
      'width': 120.0,
      'depth': 1.6,
      'material': "paper",
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
}
