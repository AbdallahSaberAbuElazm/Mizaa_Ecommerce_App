import 'package:flutter/material.dart';
import 'package:test_ecommerce_app/controllers/controllers.dart';
import 'package:test_ecommerce_app/controllers/user/user_authentication_controller.dart';
import 'package:test_ecommerce_app/shared/constants/ColorConstants.dart';
import 'package:test_ecommerce_app/shared/shared_preferences.dart';
import 'package:test_ecommerce_app/shared/utils.dart';
import 'package:test_ecommerce_app/views/widgets/custom_button.dart';
import 'package:get/get.dart';

class UserLocationScreen extends StatefulWidget {
  UserLocationScreen({Key? key}) : super(key: key);

  @override
  State<UserLocationScreen> createState() => _UserLocationScreenState();
}

class _UserLocationScreenState extends State<UserLocationScreen> {

  @override
  void initState() {
    super.initState();

    setState(() {
      SharedPreferencesClass.setUserLanguageCode(language: 'ar');
      SharedPreferencesClass.setUserLanguageName(language: 'العربية');

    });
  }

  @override
  Widget build(BuildContext context) {

    return Obx(() => Directionality(
          textDirection: Controllers.directionalityController.direction.value,
          child: Scaffold(
            backgroundColor: ColorConstants.mainColor,
            body: Stack(
              children: [
                Image.asset(
                  'assets/images/splash_screen.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 88, left: 16, right: 16),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/mizaaLogo.png',
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          SharedPreferencesClass.getLanguageCode() == 'ar'
                              ? '( لإكتشاف العروض القريبة منك )'
                              : '( To discover offers near you )',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        // Stack(
                        //   children: [
                        const SizedBox(
                          height: 45,
                        ),
                        // Obx(() => (Controllers.directionalityController
                        //         .countries.isNotEmpty)
                        //     ? const SizedBox()
                        //     : const Center(
                        //         child: CircularProgressIndicator(
                        //         color: Colors.white,
                        //       ))),
                        //   ],
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildDropHeader(
                                text:
                                    SharedPreferencesClass.getLanguageCode() ==
                                            'ar'
                                        ? 'اللغة'
                                        : "Language"),
                            const SizedBox(
                              height: 8,
                            ),
                            Utils.drawDropDownListStringsBtn(
                                optionName: 'اللغة',
                                dropDownValue: Controllers
                                    .directionalityController
                                    .dropLanguageData
                                    .value,
                                onChanged: (value) {
                                  Controllers.directionalityController
                                      .dropLanguageData.value = value;

                                  if (Controllers.directionalityController
                                          .dropLanguageData.value ==
                                      'العربية') {
                                    Controllers.directionalityController
                                        .direction.value = TextDirection.rtl;
                                    Controllers.directionalityController
                                        .textAlign.value = TextAlign.right;
                                    setState(() {
                                      Utils.direction = TextDirection.rtl;
                                      Utils.textAlign = TextAlign.right;
                                    });
                                  } else {
                                    Controllers.directionalityController
                                        .direction.value = TextDirection.ltr;
                                    Controllers.directionalityController
                                        .textAlign.value = TextAlign.left;
                                    Utils.direction = TextDirection.ltr;
                                    Utils.textAlign = TextAlign.left;
                                  }

                                  setState(() {
                                    SharedPreferencesClass.setUserLanguageCode(
                                        language: (Controllers
                                                    .directionalityController
                                                    .dropLanguageData ==
                                                'العربية')
                                            ? 'ar'
                                            : 'en');
                                    SharedPreferencesClass.setUserLanguageName(
                                        language: Controllers
                                            .directionalityController
                                            .dropLanguageData
                                            .value);
                                  });
                                  Controllers
                                      .directionalityController
                                      .dropCountryData
                                      .value ='';
                                  Controllers
                                      .directionalityController
                                      .dropCityData
                                      .value ='';
                                },
                                menu: [
                                  'العربية',
                                  'English',
                                ],
                                context: context,
                                iconSize: 34,
                                containerBorderColor: Colors.white,
                                textColor: ColorConstants.mainColor),
                            const SizedBox(
                              height: 14,
                            ),
                            _buildDropHeader(
                                text:
                                    SharedPreferencesClass.getLanguageCode() ==
                                            'ar'
                                        ? 'اختر الدولة'
                                        : 'Select the country'),
                            const SizedBox(
                              height: 8,
                            ),

                            Obx(
                              () =>Utils.drawDropDownListCountriesBtn(
                                        optionName: SharedPreferencesClass
                                                    .getLanguageCode() ==
                                                'ar'
                                            ? 'اختر الدولة'
                                            : 'Select the country',
                                        dropDownValue: Controllers
                                            .directionalityController
                                            .dropCountryData
                                            .value,
                                        onChanged: (country) {
                                          Controllers
                                              .directionalityController
                                              .dropCountryData
                                              .value = SharedPreferencesClass
                                                      .getLanguageCode() ==
                                                  'ar'
                                              ? country.arName
                                              : country.enName;
                                          // setState(() {
                                            SharedPreferencesClass
                                                .setUserCountryId(
                                                    countryId:
                                                        country.id.toString());
                                          // });

                                          Controllers.userAuthenticationController
                                              .getCities(
                                                  countryId:
                                                      country.id.toString());

                                          Controllers.directionalityController
                                              .dropCityData.value = "";
                                        },
                                        menu:
                                        Controllers
                                            .directionalityController.countries,
                                        context: context,
                                        iconSize: 34,
                                        containerBorderColor: Colors.white,
                                        textColor: ColorConstants.mainColor)
                                  ),
                            const SizedBox(
                              height: 14,
                            ),
                            _buildDropHeader(
                                text:
                                    SharedPreferencesClass.getLanguageCode() ==
                                            'ar'
                                        ? 'اختر المدينة'
                                        : 'Select the city'),
                            const SizedBox(
                              height: 8,
                            ),
                            Obx(
                              () => Utils.drawDropDownListCitiesBtn(
                                  optionName: SharedPreferencesClass
                                              .getLanguageCode() ==
                                          'ar'
                                      ? 'اختر المدينة'
                                      : 'Select the city',
                                  dropDownValue: Controllers
                                      .directionalityController
                                      .dropCityData
                                      .value,
                                  onChanged: (city) {
                                    Controllers
                                        .directionalityController
                                        .dropCityData
                                        .value = SharedPreferencesClass
                                                .getLanguageCode() ==
                                            'ar'
                                        ? city.arName
                                        : city.enName;
                                    // setState(() {
                                      SharedPreferencesClass.setUserCity(
                                          cityId: city.id.toString());
                                    // });
                                  },
                                  menu: Controllers
                                      .directionalityController.cities,
                                  context: context,
                                  iconSize: 34,
                                  containerBorderColor: Colors.white,
                                  textColor: ColorConstants.mainColor),
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                            CustomButton(
                                btnText:
                                    SharedPreferencesClass.getLanguageCode() ==
                                            'ar'
                                        ? 'متابعة'
                                        : 'Next',
                                textColor: ColorConstants.mainColor,
                                textSize: 17,
                                btnBackgroundColor: Colors.white,
                                btnOnpressed: () {
                                  print(
                                      'user loc ${SharedPreferencesClass.getLanguageCode()} ${SharedPreferencesClass.getCountryId()}  ${SharedPreferencesClass.getCityId()}');
                                  if (SharedPreferencesClass
                                              .getLanguageCode() !=
                                          null &&
                                      SharedPreferencesClass.getCountryId() !=
                                          null &&
                                      SharedPreferencesClass.getCityId() !=
                                          null) {
                                    Get.offAllNamed('/login');
                                  } else {
                                    Utils.snackBar(
                                        context: context,
                                        msg: SharedPreferencesClass
                                                    .getLanguageCode() ==
                                                'ar'
                                            ? 'أكمل البيانات'
                                            : 'Complete the data');
                                  }
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildDropHeader({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w500,
        fontFamily: 'Noto Kufi Arabic',
      ),
      textAlign: Controllers.directionalityController.textAlign.value,
    );
  }

}
