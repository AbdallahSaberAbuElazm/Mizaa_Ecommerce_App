// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CountryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountryModel _$$_CountryModelFromJson(Map<String, dynamic> json) =>
    _$_CountryModel(
      id: json['id'] as int,
      key: json['key'] as String,
      arName: json['arName'] as String,
      enName: json['enName'] as String,
      shortName: json['shortName'] as String,
      mobileMaxLength: json['mobileMaxLength'] as int,
      phoneCode: json['phoneCode'] as String,
      coinId: json['coinId'] as int,
      cities: json['cities'],
      coin: json['coin'],
    );

Map<String, dynamic> _$$_CountryModelToJson(_$_CountryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'arName': instance.arName,
      'enName': instance.enName,
      'shortName': instance.shortName,
      'mobileMaxLength': instance.mobileMaxLength,
      'phoneCode': instance.phoneCode,
      'coinId': instance.coinId,
      'cities': instance.cities,
      'coin': instance.coin,
    };
