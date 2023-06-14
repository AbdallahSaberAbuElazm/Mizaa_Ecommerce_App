// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OfferOptions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OfferOptions _$$_OfferOptionsFromJson(Map<String, dynamic> json) =>
    _$_OfferOptions(
      id: json['id'] as int,
      key: json['key'] as String,
      offerId: json['offerId'] as int,
      arOfferOptionDesc: json['arOfferOptionDesc'] as String,
      enOfferOptionDesc: json['enOfferOptionDesc'] as String,
      priceBeforDesc: (json['priceBeforDesc'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      priceAfterDesc: (json['priceAfterDesc'] as num).toDouble(),
      expireDate: DateTime.parse(json['expireDate'] as String),
      creationDate: DateTime.parse(json['creationDate'] as String),
      availablaAmount: json['availablaAmount'] as int?,
      numberOfPruchaces: json['numberOfPruchaces'] as int?,
    );

Map<String, dynamic> _$$_OfferOptionsToJson(_$_OfferOptions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'offerId': instance.offerId,
      'arOfferOptionDesc': instance.arOfferOptionDesc,
      'enOfferOptionDesc': instance.enOfferOptionDesc,
      'priceBeforDesc': instance.priceBeforDesc,
      'discount': instance.discount,
      'priceAfterDesc': instance.priceAfterDesc,
      'expireDate': instance.expireDate.toIso8601String(),
      'creationDate': instance.creationDate.toIso8601String(),
      'availablaAmount': instance.availablaAmount,
      'numberOfPruchaces': instance.numberOfPruchaces,
    };
