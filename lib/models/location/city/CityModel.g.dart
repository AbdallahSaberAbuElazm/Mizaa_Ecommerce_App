// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CityModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CityModel _$$_CityModelFromJson(Map<String, dynamic> json) => _$_CityModel(
      id: json['id'] as int,
      key: json['key'] as String,
      arName: json['arName'] as String,
      enName: json['enName'] as String,
      country: json['country'],
      offers: json['offers'],
    );

Map<String, dynamic> _$$_CityModelToJson(_$_CityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'arName': instance.arName,
      'enName': instance.enName,
      'country': instance.country,
      'offers': instance.offers,
    };
