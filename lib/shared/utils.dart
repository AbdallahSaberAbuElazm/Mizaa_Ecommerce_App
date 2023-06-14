import 'package:flutter/material.dart';
import 'package:test_ecommerce_app/models/location/city/CityModel.dart';
import 'package:test_ecommerce_app/models/location/country/CountryModel.dart';
import 'package:test_ecommerce_app/shared/constants/ColorConstants.dart';
import 'package:test_ecommerce_app/shared/shared_preferences.dart';
import 'package:test_ecommerce_app/controllers/controllers.dart';

class Utils{
  static snackBar({required BuildContext context, required String? msg}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 2300),
      content: Text(
        msg!,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 16,fontFamily: 'Noto Kufi Arabic',
            fontWeight: FontWeight.w400
        ),
        textAlign: Controllers.directionalityController.textAlign.value,
      ),
      backgroundColor: ColorConstants.mainColor,
    ));
  }

  static String getDateTime({required DateTime dateTime}){
    return '${dateTime.year}-${dateTime.month}-${dateTime.day}';
  }

static  Widget buildLogo(){
    return Center(child: Image.asset('assets/images/mizaa_logo_dark.png', height: 65,fit: BoxFit.cover,));
  }


  //////////////////////////////////////////////
  // // localization
  static TextDirection direction = getDirection((SharedPreferencesClass.getLanguageCode()== null || SharedPreferencesClass.getLanguageCode() == '') ? 'ar' : SharedPreferencesClass.getLanguageCode().toString());
  static TextAlign textAlign = getTextAlign(SharedPreferencesClass.getLanguageCode().toString());

  static TextDirection getDirection(String languageCode) {
    switch (languageCode) {
      case 'ar':
        return TextDirection.rtl; // Right-to-left for Arabic
      default:
        return TextDirection.ltr; // Left-to-right for other languages
    }
  }



  static TextAlign getTextAlign(String languageCode) {
    switch (languageCode) {
      case 'ar':
        return TextAlign.right; // Right alignment for Arabic
      default:
        return TextAlign.left; // Left alignment for other languages
    }
  }
  ////////////////////////////////////////////////
  static Widget drawDropDownListStringsBtn(
      {required String optionName,
        required String dropDownValue,
        required dynamic onChanged,
        required List menu,
        required BuildContext context,
        required double iconSize,
        required Color containerBorderColor,
        required Color textColor}) {
    return DropdownButtonHideUnderline(
      child: Container(
        height: 54,
        padding: const EdgeInsets.only(left: 20,right: 20),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(width: 1.2, color: containerBorderColor )
        ),
        child: DropdownButton(
          // borderRadius: BorderRadius.circular(5),
            hint: dropDownValue.isEmpty
                ? Text(
              optionName,
              style:  TextStyle(
                color: textColor,
                fontSize: 13,
                fontWeight: FontWeight.w500
                ,fontFamily: 'Noto Kufi Arabic',),
            )
                : Text(
              dropDownValue,
              style:  TextStyle(color: textColor,fontFamily: 'Noto Kufi Arabic',fontWeight: FontWeight.w600),
            ),
            isExpanded: true,
            iconSize: iconSize,iconDisabledColor: textColor,iconEnabledColor: textColor,
            // alignment: Alignment.center,
            style:  TextStyle(color: textColor,fontFamily: 'Noto Kufi Arabic',),
            items: menu.map(
                  (val) {
                return DropdownMenuItem<String>(
                  alignment: Alignment.topRight,
                  value: val,
                  child: Text(
                    val,
                    textAlign: TextAlign.end,
                    style:  TextStyle(
                      color: textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                      ,fontFamily: 'Noto Kufi Arabic',),

                  ),
                );
              },
            ).toList(),
            onChanged: onChanged),
      ),
    );
  }

  static Widget drawDropDownListCountriesBtn(
      {required String optionName,
        required String dropDownValue,
        required dynamic onChanged,
        required List<CountryModel> menu,
        required BuildContext context,
        required double iconSize,
      required Color containerBorderColor,
      required Color textColor}) {
    return  Container(
        height: 54,
        padding: const EdgeInsets.only(left: 20,right: 20),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius:const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1.2, color: containerBorderColor )
        ),
        child:DropdownButtonHideUnderline(
          child: DropdownButton<CountryModel>(
          // borderRadius: BorderRadius.circular(5),
            hint: dropDownValue.isEmpty
                ? Text(
              optionName,
              style:  TextStyle(
                color: textColor,
                fontSize: 13,
                fontWeight: FontWeight.w500
                ,fontFamily: 'Noto Kufi Arabic',),
            )
                : Text(
              dropDownValue,
              style:  TextStyle(color: textColor,fontFamily: 'Noto Kufi Arabic',fontWeight: FontWeight.w600),
            ),
            isExpanded: true,
            onChanged: onChanged,
            iconSize: iconSize,iconDisabledColor:textColor,iconEnabledColor: textColor,
            // alignment: Alignment.center,
            style:  TextStyle(color: textColor,fontFamily: 'Noto Kufi Arabic',),
            items: menu.map<DropdownMenuItem<CountryModel>>(
                  (CountryModel country) {
                return DropdownMenuItem<CountryModel>(
                  alignment:SharedPreferencesClass.getLanguageCode() == 'ar'? Alignment.topRight: Alignment.topLeft,
                  value: country,
                  child: Text(
                    SharedPreferencesClass.getLanguageCode() == 'ar'?  country.arName: country.enName,
                    textAlign: TextAlign.end,
                    style:  TextStyle(
                      color: textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                      ,fontFamily: 'Noto Kufi Arabic',),

                  ),
                );
              },
            ).toList(),
           ),
      ),
    );
  }

  static Widget drawDropDownListCountriesWithFlagBtn(
      {required String optionName,
        required String dropDownValue,
        required dynamic onChanged,
        required List<CountryModel> menu,
        required BuildContext context,
        required double iconSize,}) {
    return DropdownButtonHideUnderline(
      child:  SizedBox(
        height: 38,
        child: DropdownButton<CountryModel>(
            // borderRadius: BorderRadius.circular(5),
              hint: dropDownValue.isEmpty
                  ? Text(
                optionName,
                style: const TextStyle(
                  color: ColorConstants.mainColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500
                  ,fontFamily: 'Noto Kufi Arabic',),
              )
                  : Text(
                dropDownValue,
                style: const TextStyle(color: ColorConstants.mainColor,fontFamily: 'Noto Kufi Arabic',fontWeight: FontWeight.w600),
              ),
              isExpanded: true,
              iconSize: iconSize,
            iconDisabledColor: ColorConstants.mainColor,iconEnabledColor: ColorConstants.mainColor,

              // alignment: Alignment.center,
              style: const TextStyle(color: ColorConstants.mainColor,fontFamily: 'Noto Kufi Arabic',),
              items: menu.map<DropdownMenuItem<CountryModel>>(
                    (CountryModel country) {
                  return DropdownMenuItem<CountryModel>(
                    alignment: Alignment.topRight,
                    value: country,
                    child: Text(
                      generateCountryFlag(countryCode: country.shortName),
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        color: ColorConstants.mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                        ,fontFamily: 'Noto Kufi Arabic',),

                    ),
                  );
                },
              ).toList(),
              onChanged: onChanged),
      ),

    );
  }

  static String generateCountryFlag({required String countryCode}) {

    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }

  static Widget drawDropDownListCitiesBtn(
      {required String optionName,
        required String dropDownValue,
        required dynamic onChanged,
        required List<CityModel> menu,
        required BuildContext context,
        required double iconSize,
        required Color containerBorderColor,
        required Color textColor}) {
    return DropdownButtonHideUnderline(
      child: Container(
        height: 54,
        padding: const EdgeInsets.only(left: 20,right: 20),
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius:const BorderRadius.all(Radius.circular(12)),
            border: Border.all(width: 1.2, color: containerBorderColor )
        ),
        child: DropdownButton<CityModel>(
          // borderRadius: BorderRadius.circular(5),
            hint: dropDownValue.isEmpty
                ? Text(
              optionName,
              style:  TextStyle(
                color:textColor,
                fontSize: 13,
                fontWeight: FontWeight.w500
                ,fontFamily: 'Noto Kufi Arabic',),
            )
                : Text(
              dropDownValue,
              style:  TextStyle(color: textColor,fontFamily: 'Noto Kufi Arabic',fontWeight: FontWeight.w600),
            ),
            isExpanded: true,
            iconSize: iconSize,iconDisabledColor: textColor,iconEnabledColor: ColorConstants.mainColor,
            // alignment: Alignment.center,
            style:  TextStyle(color: textColor,fontFamily: 'Noto Kufi Arabic',),
            items: menu.map<DropdownMenuItem<CityModel>>(
                  (CityModel city) {
                return DropdownMenuItem<CityModel>(
                  alignment: SharedPreferencesClass.getLanguageCode() == 'ar'?Alignment.topRight:Alignment.topLeft,
                  value: city,
                  child: Text(
                    SharedPreferencesClass.getLanguageCode() == 'ar'? city.arName:city.enName,
                    textAlign: TextAlign.end,
                    style:  TextStyle(
                      color: textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                      ,fontFamily: 'Noto Kufi Arabic',),

                  ),
                );
              },
            ).toList(),
            onChanged: onChanged),
      ),
    );
  }



}