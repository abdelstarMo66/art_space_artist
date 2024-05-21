// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyProductsResponse _$GetMyProductsResponseFromJson(
        Map<String, dynamic> json) =>
    GetMyProductsResponse(
      status: json['status'] as String?,
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      products: json['data'] == null
          ? null
          : Products.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetMyProductsResponseToJson(
        GetMyProductsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.products,
    };

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      productsInfo: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductsInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'pagination': instance.pagination,
      'products': instance.productsInfo,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      numbersOfPages: (json['numbersOfPages'] as num?)?.toInt(),
      totalResults: (json['totalResults'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'limit': instance.limit,
      'numbersOfPages': instance.numbersOfPages,
      'totalResults': instance.totalResults,
    };

ProductsInfo _$ProductsInfoFromJson(Map<String, dynamic> json) => ProductsInfo(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      coverImage: json['coverImage'] == null
          ? null
          : CoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
      isAvailable: json['isAvailable'] as bool?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$ProductsInfoToJson(ProductsInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'isAvailable': instance.isAvailable,
      'coverImage': instance.coverImage,
    };

CoverImage _$CoverImageFromJson(Map<String, dynamic> json) => CoverImage(
      imageId: json['imageId'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CoverImageToJson(CoverImage instance) =>
    <String, dynamic>{
      'imageId': instance.imageId,
      'image': instance.image,
    };
