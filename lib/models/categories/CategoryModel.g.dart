// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      id: json['id'] as int,
      key: json['key'] as String,
      arName: json['arName'] as String,
      enName: json['enName'] as String,
      imageUrl: json['imageUrl'] as String,
      image: json['image'] as String?,
      order: json['order'] as int,
      subCategories: (json['subCategories'] as List<dynamic>?)
          ?.map((e) => SubCategoriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'arName': instance.arName,
      'enName': instance.enName,
      'imageUrl': instance.imageUrl,
      'image': instance.image,
      'order': instance.order,
      'subCategories': instance.subCategories,
    };
