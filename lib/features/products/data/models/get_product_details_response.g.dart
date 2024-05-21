// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductDetailsResponse _$GetProductDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetProductDetailsResponse(
      message: json['message'] as String,
      status: json['status'] as String,
      code: (json['code'] as num).toInt(),
      productDetails:
          ProductDetails.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProductDetailsResponseToJson(
        GetProductDetailsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
      'data': instance.productDetails,
    };

ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) =>
    ProductDetails(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toInt(),
      isAvailable: json['isAvailable'] as bool,
      category: json['category'] as String,
      style: json['style'] as String,
      subject: json['subject'] as String,
      height: (json['height'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      depth: (json['depth'] as num).toDouble(),
      coverImage:
          CoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>)
          .map((e) => CoverImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      material: json['material'] as String?,
    );

Map<String, dynamic> _$ProductDetailsToJson(ProductDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'isAvailable': instance.isAvailable,
      'category': instance.category,
      'style': instance.style,
      'subject': instance.subject,
      'height': instance.height,
      'width': instance.width,
      'depth': instance.depth,
      'coverImage': instance.coverImage,
      'images': instance.images,
      'material': instance.material,
    };

CoverImage _$CoverImageFromJson(Map<String, dynamic> json) => CoverImage(
      imageId: json['imageId'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$CoverImageToJson(CoverImage instance) =>
    <String, dynamic>{
      'imageId': instance.imageId,
      'image': instance.image,
    };
