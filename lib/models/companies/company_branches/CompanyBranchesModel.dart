import 'package:test_ecommerce_app/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'CompanyBranchesModel.freezed.dart';
part 'CompanyBranchesModel.g.dart';

@freezed
class CompanyBranchesModel with _$CompanyBranchesModel {
  factory CompanyBranchesModel({
    required int id,
    required String key,
    required String areaAr,
    required String areaEn,
    required String addressAr,
    required String addressEn,
    required String longitude,
    required String latitude,

  }) = _CompanyBranchesModel;

  factory CompanyBranchesModel.fromJson(Map<String, dynamic> json) => _$CompanyBranchesModelFromJson(json);


}
