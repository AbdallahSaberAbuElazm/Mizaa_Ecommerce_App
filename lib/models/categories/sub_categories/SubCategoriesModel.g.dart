// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubCategoriesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubCategoryModel _$$_SubCategoryModelFromJson(Map<String, dynamic> json) =>
    _$_SubCategoryModel(
      id: json['id'] as int,
      categoryId: json['categoryId'] as int,
      key: json['key'] as String,
      arName: json['arName'] as String,
      enName: json['enName'] as String,
      imageUrl: json['imageUrl'] as String,
      image: json['image'] as String?,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      offers: json['offers'] == null
          ? null
          : OfferModel.fromJson(json['offers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SubCategoryModelToJson(_$_SubCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'key': instance.key,
      'arName': instance.arName,
      'enName': instance.enName,
      'imageUrl': instance.imageUrl,
      'image': instance.image,
      'category': instance.category,
      'offers': instance.offers,
    };
