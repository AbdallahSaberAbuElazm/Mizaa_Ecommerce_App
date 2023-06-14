// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductContent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductContent _$$_ProductContentFromJson(Map<String, dynamic> json) =>
    _$_ProductContent(
      title: json['title'] as String,
      contains:
          (json['contains'] as List<dynamic>).map((e) => e as String).toList(),
      price: json['price'] as String,
      discount: json['discount'] as String,
      discountPrice: json['discountPrice'] as String,
    );

Map<String, dynamic> _$$_ProductContentToJson(_$_ProductContent instance) =>
    <String, dynamic>{
      'title': instance.title,
      'contains': instance.contains,
      'price': instance.price,
      'discount': instance.discount,
      'discountPrice': instance.discountPrice,
    };
