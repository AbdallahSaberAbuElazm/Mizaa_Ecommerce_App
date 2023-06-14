// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OfferImages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OfferImages _$$_OfferImagesFromJson(Map<String, dynamic> json) =>
    _$_OfferImages(
      id: json['id'] as int?,
      key: json['key'] as String?,
      offerId: json['offerId'] as int?,
      imagePath: json['imagePath'] as String?,
      image: json['image'],
      arImageDescription: json['arImageDescription'] as String?,
      enImageDescription: json['enImageDescription'] as String?,
      isPrimary: json['isPrimary'] as bool?,
    );

Map<String, dynamic> _$$_OfferImagesToJson(_$_OfferImages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'offerId': instance.offerId,
      'imagePath': instance.imagePath,
      'image': instance.image,
      'arImageDescription': instance.arImageDescription,
      'enImageDescription': instance.enImageDescription,
      'isPrimary': instance.isPrimary,
    };
