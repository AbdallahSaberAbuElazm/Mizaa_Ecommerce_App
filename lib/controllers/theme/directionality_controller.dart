

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test_ecommerce_app/models/location/city/CityModel.dart';
import 'package:test_ecommerce_app/models/location/country/CountryModel.dart';
import 'package:test_ecommerce_app/shared/shared_preferences.dart';

class DirectionalityController extends GetxController{

  final direction = TextDirection.rtl.obs;
  final textAlign = TextAlign.right.obs;

  final dropLanguageData = 'العربية'.obs;
  final  dropCountryData = ''.obs;
  final dropCityData = ''.obs;

  final countries = <CountryModel>[].obs;
  final cities = <CityModel>[].obs;

  final isPasswordAndConfirmPasswordMatched = false.obs;

  updateCountries({required  List<CountryModel> countriesData}){
    countries.value = countriesData;
    update();
  }

  updateCities({required  List<CityModel> citiesData}){
    cities.value = citiesData;
    update();
  }

  //
  // TextDirection getDirection(String languageCode) {
  //   switch (languageCode) {
  //     case 'ar':
  //       return TextDirection.rtl; // Right-to-left for Arabic
  //     default:
  //       return TextDirection.ltr; // Left-to-right for other languages
  //   }
  // }
  //
  // TextAlign getTextAlign(String languageCode) {
  //   switch (languageCode) {
  //     case 'ar':
  //       return TextAlign.right; // Right alignment for Arabic
  //     default:
  //       return TextAlign.left; // Left alignment for other languages
  //   }
  // }
}