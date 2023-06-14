// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CompanyBranchesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompanyBranchesModel _$$_CompanyBranchesModelFromJson(
        Map<String, dynamic> json) =>
    _$_CompanyBranchesModel(
      id: json['id'] as int,
      key: json['key'] as String,
      areaAr: json['areaAr'] as String,
      areaEn: json['areaEn'] as String,
      addressAr: json['addressAr'] as String,
      addressEn: json['addressEn'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
    );

Map<String, dynamic> _$$_CompanyBranchesModelToJson(
        _$_CompanyBranchesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'areaAr': instance.areaAr,
      'areaEn': instance.areaEn,
      'addressAr': instance.addressAr,
      'addressEn': instance.addressEn,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
