import 'dart:convert';

import 'package:test_ecommerce_app/models/offers/OfferModel.dart';
import 'package:test_ecommerce_app/services/networking/ApiConstants.dart';
import 'package:test_ecommerce_app/shared/error/exception.dart';
import 'package:http/http.dart' as http;

class OfferRepository {
  // final ApiService _apiService;
  // OfferRepository(this._apiService);



  Future<List<OfferModel>> getCarouselOffers({required String cityId}) async {
    var response =  await http.get(Uri.parse('${ApiConstants.carouselHomePageOfferByCityUrl}$cityId'));
    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
     return  body.map((json) => OfferModel.fromJson(json)).toList();

  }else {
      throw ServerException();
    }
  }

  Future<List<OfferModel>> getTodayOffers({required String cityId}) async {
    var response =  await http.get(Uri.parse('${ApiConstants.todayOfferByCityUrl}$cityId'));
    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return  body.map((json) => OfferModel.fromJson(json)).toList();

    }else {
      throw ServerException();
    }
  }

  Future<List<OfferModel>> getSpecialOffers({required String cityId}) async {
    var response =  await http.get(Uri.parse('${ApiConstants.specialOfferByCityUrl}$cityId'));
    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return  body.map((json) => OfferModel.fromJson(json)).toList();

    }else {
      throw ServerException();
    }
  }

  Future<List<OfferModel>> getMostSalesOffers({required String cityId}) async {
    var response =  await http.get(Uri.parse('${ApiConstants.mostSalesOfferByCityUrl}$cityId'));
    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return  body.map((json) => OfferModel.fromJson(json)).toList();

    }else {
      throw ServerException();
    }
  }

  Future<List<OfferModel>> getOffersForMainCategories({required String categoryId, required String city})async {
    var response =  await http.get(Uri.parse('${ApiConstants.offersByMainCategoryIdUrl}$categoryId/$city'));
    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return  body.map((json) => OfferModel.fromJson(json)).toList();

    }else {
      throw ServerException();
    }
  }

  Future<List<OfferModel>> getOffersForSubCategories({required String subCategoryId, required String city})async {
    var response =  await http.get(Uri.parse('${ApiConstants.offersBySubCategoryIdUrl}$subCategoryId/$city'));
    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return  body.map((json) => OfferModel.fromJson(json)).toList();

    }else {
      throw ServerException();
    }
  }


  // Future<JSON> getOfferId(int id) async {
  //   var products = await getTodayOffers();
  //   var product = products.firstWhere((element) => element['id'] == id);
  //
  //   return product;
  // }


}
