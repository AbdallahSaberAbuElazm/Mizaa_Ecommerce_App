import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:restart_app/restart_app.dart';
import 'package:test_ecommerce_app/controllers/home/HomeController.dart';
import 'package:test_ecommerce_app/controllers/offers/OfferController.dart';
import 'package:test_ecommerce_app/controllers/controllers.dart';
import 'package:test_ecommerce_app/models/categories/CategoryModel.dart';
import 'package:test_ecommerce_app/models/companies/CompanyModel.dart';
import 'package:test_ecommerce_app/models/location/city/CityModel.dart';
import 'package:test_ecommerce_app/models/offers/OfferModel.dart';
import 'package:test_ecommerce_app/shared/shared_preferences.dart';
import 'package:test_ecommerce_app/shared/utils.dart';
import 'package:test_ecommerce_app/views/offer/sub_categories.dart';
import 'package:test_ecommerce_app/views/offer/OfferCard.dart';
import 'package:test_ecommerce_app/views/offer/new_offer_card.dart';
import 'package:test_ecommerce_app/views/offer/most_seller_offer_card.dart';
import 'package:test_ecommerce_app/views/widgets/custom_button.dart';
import 'package:test_ecommerce_app/views/widgets/shimmer_container.dart';
import 'package:test_ecommerce_app/services/networking/ApiConstants.dart';
import 'package:test_ecommerce_app/shared/constants/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce_app/views/widgets/shimmer_list_view.dart';
import 'package:test_ecommerce_app/views/offer/OfferDescriptionPage.dart';
import 'package:test_ecommerce_app/views/offer/OfferListForMainCategoryPage.dart';
import 'package:test_ecommerce_app/views/offer/OfferListForSubCategoryPage.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:test_ecommerce_app/views/widgets/custom_text_line_through.dart';
import 'package:test_ecommerce_app/views/widgets/custom_indicator_carousel.dart';

class ExploreTab extends GetView<HomeController> {
  ExploreTab({Key? key}) : super(key: key);

  // final UserAuthenticationController userAuthenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Directionality(
        textDirection: Utils.direction,
        child: SafeArea(
            child: Obx(() => Scaffold(
                  extendBodyBehindAppBar:
                      true, // Extend the body behind the app bar
                  appBar: AppBar(
                      backgroundColor: controller.appBarColor
                          .value, // Set the background color to transparent
                      elevation: 0,
                      toolbarHeight: 80,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      title: _buildAppBar(context: context)),
                  body: ListView(
                      controller: controller.scrollController,
                      padding: EdgeInsets.zero,
                      children: [
                        _buildOfferCarousel(context),
                        Transform.translate(
                            offset: const Offset(0, -50),
                            child: Obx(() => CustomIndicatorCarousel(
                                list: controller.activeCarouselOffers,
                                currentBanner:
                                    controller.currentBanner.value))),

                        _buildCashback(context: context),

                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 118,
                            width: MediaQuery.of(context).size.width,
                            child: Obx(
                              () => (controller.mainCategories.isNotEmpty)
                                  ? ListView(
                                      physics: const ScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        _buildLocationCategory(theme: theme),
                                        _buildCategories(theme),
                                      ],
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(
                                          left: SharedPreferencesClass
                                                      .getLanguageCode() ==
                                                  'ar'
                                              ? 0
                                              : 8,
                                          right: SharedPreferencesClass
                                                      .getLanguageCode() ==
                                                  'ar'
                                              ? 8
                                              : 0),
                                      child: ShimmerListView(
                                        width: 118,
                                        height: 112,
                                        topPadding: 0,
                                        bottomPadding: 0,
                                        leftPadding: SharedPreferencesClass
                                                    .getLanguageCode() ==
                                                'ar'
                                            ? 4
                                            : 0,
                                        rightPadding: SharedPreferencesClass
                                                    .getLanguageCode() ==
                                                'ar'
                                            ? 0
                                            : 4,
                                      ),
                                    ),
                            )),
                        const SizedBox(
                          height: 16,
                        ),
                        _buildSection(
                            title:
                                SharedPreferencesClass.getLanguageCode() == 'ar'
                                    ? 'أقوى العروض'
                                    : 'Hot offers',
                            onPressed: () {
                              Get.to(() => OfferListForMainCategoryPage(
                                  mainCategoryName: SharedPreferencesClass
                                              .getLanguageCode() ==
                                          'ar'
                                      ? 'أقوى العروض'
                                      : 'Hot offers',
                                  offers: controller.todayOffers));
                            },
                            theme: theme),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() => (controller.todayOffers.isNotEmpty)
                            ? _buildTheStrongestOffers(
                                offerModels: controller.todayOffers,
                                theme: theme,
                              )
                            : _shimmerForListViewForOffer(height: 224)),
                        const SizedBox(
                          height: 3,
                        ),
                        _buildSection(
                            title:
                                SharedPreferencesClass.getLanguageCode() == 'ar'
                                    ? 'فسح وخروجات'
                                    : 'Outings',
                            onPressed: () {
                              Get.to(() => SubCategoryPage(
                                  categories: controller.subCategories,
                                  subCategoryName: SharedPreferencesClass
                                              .getLanguageCode() ==
                                          'ar'
                                      ? 'فسح وخروجات'
                                      : 'Outings'));
                            },
                            theme: theme),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildSubCategoryOutings(theme),
                        const SizedBox(
                          height: 16,
                        ),
                        _buildSection(
                            title:
                                SharedPreferencesClass.getLanguageCode() == 'ar'
                                    ? 'الأكثر مبيعاً'
                                    : 'Most Seller',
                            onPressed: () {
                              Get.to(() => OfferListForMainCategoryPage(
                                  mainCategoryName: SharedPreferencesClass
                                              .getLanguageCode() ==
                                          'ar'
                                      ? 'الأكثر مبيعاً'
                                      : 'Most Seller',
                                  offers: controller.mostSellerOffers));
                            },
                            theme: theme),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() => (controller.mostSellerOffers.isNotEmpty)
                            ? _buildMostSellerOffers(
                                offerModels: controller.mostSellerOffers,
                                theme: theme,
                              )
                            : _shimmerForListViewForOffer(height: 224)),

                        _buildSection(
                            title:
                                SharedPreferencesClass.getLanguageCode() == 'ar'
                                    ? 'العروض الجديدة'
                                    : 'New offers',
                            onPressed: () {
                              Get.to(() => OfferListForMainCategoryPage(
                                  mainCategoryName: SharedPreferencesClass
                                              .getLanguageCode() ==
                                          'ar'
                                      ? 'العروض الجديدة'
                                      : 'New offers',
                                  offers: controller.specialOffers));
                            },
                            theme: theme),
                        const SizedBox(
                          height: 10,
                        ),
                        // Obx(() => (controller.specialOffers.isNotEmpty)
                        //     ? _buildNewOfferCard(
                        //         offerModels: controller.specialOffers,
                        //         theme: theme,
                        //       )
                        Obx(() => (controller.todayOffers.isNotEmpty)
                            ? _buildNewOfferCard(
                                offerModels: controller.todayOffers,
                                theme: theme,
                                context: context)
                            : _shimmerForListViewForOffer(height: 260)),

                        const SizedBox(
                          height: 16,
                        ),

                        Obx(() => CustomIndicatorCarousel(
                            list: controller.todayOffers,
                            currentBanner:
                                controller.currentBannerNewOffer.value)),
                        const SizedBox(
                          height: 25,
                        ),
                      ]),
                ))));
  }

  ////////////////////////////////////////////////
  Widget _buildAppBar({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        appBarDropDown(context: context),
        Row(
          children: [
            Obx(() => appBarIcon(
                icon: Icons.search,
                containerColor: controller.appBarItemContainerColor.value,
                iconColor: controller.appBarItemColor.value)),
            const SizedBox(
              width: 6,
            ),
            Obx(() => appBarIcon(
                icon: Icons.notifications,
                containerColor: controller.appBarItemContainerColor.value,
                iconColor: controller.appBarItemColor.value)),
            const SizedBox(
              width: 6,
            ),
            Obx(() => appBarIcon(
                icon: Icons.shopping_cart_rounded,
                containerColor: controller.appBarItemContainerColor.value,
                iconColor: controller.appBarItemColor.value)),
          ],
        )
      ],
    );
  }

  Widget appBarDropDown({required BuildContext context}) {
    CityModel city = Controllers.directionalityController.cities
        .where((city) =>
            city.id == int.parse(SharedPreferencesClass.getCityId().toString()))
        .single;
    return GestureDetector(
      onTap: () => _buildBottomSheet(context: context),
      child: Container(
        height: 37,
        width: 140,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: controller.appBarItemContainerColor.value),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.location_on_sharp,
              color: controller.appBarItemColor.value,
              size: 24,
            ),
            const SizedBox(width: 3),
            Text(
              SharedPreferencesClass.getLanguageCode() == 'ar'
                  ? city.arName
                  : city.enName,
              style: TextStyle(
                color: controller.appBarItemColor.value,
                fontFamily: 'Noto Kufi Arabic',
                fontSize: 13,
              ),
            ),
            const SizedBox(width: 3),
            Icon(
              Icons.arrow_drop_down,
              color: controller.appBarItemColor.value,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  //to detect ( language - country - city)
  _buildBottomSheet({required BuildContext context}) {
    Get.bottomSheet(Directionality(
      textDirection: Utils.direction,
      child: Container(
          padding: const EdgeInsets.all(16),
          height: 570,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildDropHeader(
                  text: SharedPreferencesClass.getLanguageCode() == 'ar'
                      ? 'اللغة'
                      : "Language"),
              const SizedBox(
                height: 8,
              ),
              Obx(() => Utils.drawDropDownListStringsBtn(
                  optionName: 'اللغة',
                  dropDownValue: controller.dropLanguageData.value,
                  onChanged: (value) {
                    controller.dropLanguageData.value = value;
                  },
                  menu: [
                    'العربية',
                    'English',
                  ],
                  context: context,
                  iconSize: 34,
                  containerBorderColor: ColorConstants.greyColor,
                  textColor: ColorConstants.black0)),
              const SizedBox(
                height: 14,
              ),
              _buildDropHeader(
                  text: SharedPreferencesClass.getLanguageCode() == 'ar'
                      ? 'اختر الدولة'
                      : 'Select the country'),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => Utils.drawDropDownListCountriesBtn(
                    optionName: SharedPreferencesClass.getLanguageCode() == 'ar'
                        ? 'اختر الدولة'
                        : 'Select the country',
                    dropDownValue: controller.dropCountryData.value,
                    onChanged: (country) {
                      controller.dropCountryData.value =
                          SharedPreferencesClass.getLanguageCode() == 'ar'
                              ? country.arName
                              : country.enName;

                      Controllers.userAuthenticationController
                          .getCities(countryId: country.id.toString());

                      controller.dropCityData.value = "";

                      SharedPreferencesClass.setUserCountryId(
                          countryId: country.id.toString());
                    },
                    menu: Controllers.directionalityController.countries,
                    context: context,
                    iconSize: 34,
                    containerBorderColor: ColorConstants.greyColor,
                    textColor: ColorConstants.black0),
              ),
              const SizedBox(
                height: 14,
              ),
              _buildDropHeader(
                  text: SharedPreferencesClass.getLanguageCode() == 'ar'
                      ? 'اختر المدينة'
                      : 'Select the city'),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => Utils.drawDropDownListCitiesBtn(
                    optionName: SharedPreferencesClass.getLanguageCode() == 'ar'
                        ? 'اختر المدينة'
                        : 'Select the city',
                    dropDownValue: controller.dropCityData.value,
                    onChanged: (city) {
                      controller.dropCityData.value =
                          SharedPreferencesClass.getLanguageCode() == 'ar'
                              ? city.arName
                              : city.enName;

                      SharedPreferencesClass.setUserCity(
                          cityId: city.id.toString());
                    },
                    menu: Controllers.directionalityController.cities,
                    context: context,
                    iconSize: 34,
                    containerBorderColor: ColorConstants.greyColor,
                    textColor: ColorConstants.black0),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  btnText: SharedPreferencesClass.getLanguageCode() == 'ar'
                      ? 'حفظ'
                      : 'Save',
                  textColor: Colors.white,
                  textSize: 17,
                  btnBackgroundColor: ColorConstants.mainColor,
                  btnOnpressed: () async {
                    if (SharedPreferencesClass.getCountryId() != null &&
                        SharedPreferencesClass.getCountryId() != '' &&
                        SharedPreferencesClass.getCityId() != null &&
                        SharedPreferencesClass.getCityId() != '') {
                      SharedPreferencesClass.setUserLanguageCode(
                          language:
                              (controller.dropLanguageData.value == 'العربية')
                                  ? 'ar'
                                  : 'en');
                      SharedPreferencesClass.setUserLanguageName(
                          language: controller.dropLanguageData.value);
                      if (controller.dropLanguageData.value == 'العربية') {
                        Controllers.directionalityController.direction.value =
                            TextDirection.rtl;
                        Controllers.directionalityController.textAlign.value =
                            TextAlign.right;
                      } else {
                        Controllers.directionalityController.direction.value =
                            TextDirection.ltr;
                        Controllers.directionalityController.textAlign.value =
                            TextAlign.left;
                      }
                      await Restart.restartApp();
                    } else {
                      Utils.snackBar(
                          context: context,
                          msg: SharedPreferencesClass.getLanguageCode() == 'ar'
                              ? 'أكمل البيانات'
                              : 'Complete the data');
                    }
                  }),
            ],
          )),
    ));
  }

  Widget _buildDropHeader({required String text}) {
    return Text(text,
        style: TextStyle(
          color: ColorConstants.black0,
          fontSize: 17,
          fontWeight: FontWeight.w500,
          fontFamily: 'Noto Kufi Arabic',
        ));
  }

  Widget appBarIcon(
      {required IconData icon,
      required Color containerColor,
      required Color iconColor}) {
    return Container(
        width: 37,
        height: 37,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: containerColor),
        child: Icon(
          icon,
          color: iconColor,
          size: 24,
        ));
  }

  // build Carousel for offers
  Widget _buildOfferCarousel(context) {
    return SizedBox(
      height: 290,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SizedBox(
            height: 290,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
                carouselController: controller.carouselController,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  aspectRatio: 1,
                  initialPage: 0,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  onPageChanged: (index, reason) =>
                      controller.changeBanner(index),
                ),
                itemCount: controller.activeCarouselOffers.length,
                itemBuilder: (BuildContext contextCarousel, int itemIndex,
                    int pageViewIndex) {
                  if (controller.activeCarouselOffers.isNotEmpty &&
                      itemIndex < controller.activeCarouselOffers.length) {
                    return _buildCarouselItem(
                        controller.activeCarouselOffers[itemIndex], context);
                  } else {
                    return ShimmerContainer(
                      width: MediaQuery.of(context).size.width,
                      height: 290,
                      topPadding: 0,
                      bottomPadding: 0,
                      leftPadding: 16,
                      rightPadding: 16,
                    );
                  }
                }),
          ),
          Transform.translate(
            offset: Offset(0, 2),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 18,
                decoration: BoxDecoration(
                    color: ColorConstants.backgroundContainer,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCashback({required BuildContext context}) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 78,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/cashback_background.png',
                  ),
                  fit: BoxFit.cover)),
          child: Directionality(
            textDirection:TextDirection.rtl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  SharedPreferencesClass.getLanguageCode() == 'ar'
                      ? 'استرجاع نقدي 2% على كل مشترياتك'
                      : '2% cash back on all your purchases',
                  style: TextStyle(
                      color: ColorConstants.black0,
                      fontSize: 14.5,
                      height: 1.4,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                    width: 120,
                    height: 27,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        onPressed: () {},
                        child: Text(
                          SharedPreferencesClass.getLanguageCode() == 'ar'
                              ? 'استخدم الآن'
                              : 'Use now',
                          style: const TextStyle(
                              color: ColorConstants.mainColor,
                              fontSize: 12,
                              fontFamily: 'Noto Kufi Arabic',
                              fontWeight: FontWeight.w600),
                        )))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22, top: 4),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/images/cashback.png',
              width: 129,
              height: 71,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }

  // build carousel item
  Widget _buildCarouselItem(OfferModel offer, BuildContext context) {
    CompanyModel companyModel = CompanyModel.fromJson(offer.company!);
    return GestureDetector(
      onTap: () {
        // Get.toNamed('/product/${offer.id}');
        Get.put(OfferController());
        Get.to(() => OfferDescriptionPage(offerModel: offer));
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: CachedNetworkImageProvider(
                ApiConstants.storageURL + offer.mainImage.toString(),
              ),
              fit: BoxFit.cover,
            )),
          ),
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(110),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: 50,
                    left: SharedPreferencesClass.getLanguageCode() == 'ar'
                        ? 0
                        : 16,
                    right: SharedPreferencesClass.getLanguageCode() == 'ar'
                        ? 16
                        : 0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        SharedPreferencesClass.getLanguageCode() == 'ar'
                            ? companyModel.arName.toString()
                            : companyModel.enName.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Noto Kufi Arabic',
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.66,
                              height: 60,
                              child: Text(
                                SharedPreferencesClass.getLanguageCode() == 'ar'
                                    ? offer.arTitle.toString()
                                    : offer.enTitle.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'Noto Kufi Arabic',
                                    height: 1.3,
                                    fontWeight: FontWeight.w600),
                              )),
                          Container(
                            decoration: BoxDecoration(
                                color: ColorConstants.mainColor,
                                borderRadius: BorderRadius.only(
                                    topRight: SharedPreferencesClass
                                                .getLanguageCode() ==
                                            'ar'
                                        ? Radius.circular(12)
                                        : Radius.circular(0),
                                    bottomRight: SharedPreferencesClass
                                                .getLanguageCode() ==
                                            'ar'
                                        ? Radius.circular(12)
                                        : Radius.circular(0),
                                    topLeft: SharedPreferencesClass
                                                .getLanguageCode() ==
                                            'ar'
                                        ? Radius.circular(0)
                                        : Radius.circular(12),
                                    bottomLeft: SharedPreferencesClass
                                                .getLanguageCode() ==
                                            'ar'
                                        ? Radius.circular(0)
                                        : Radius.circular(12))),
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 5, bottom: 5),
                            child: Text(
                              '${offer.enDiscount}% \n${SharedPreferencesClass.getLanguageCode() == 'ar' ? "خصم" : 'Discount'}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Noto Kufi Arabic',
                                  height: 1.3,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _buildPriceContainer(
                              text:
                                  '${offer.priceAfterDiscount.toString()}${SharedPreferencesClass.getLanguageCode() == 'ar' ? ' جنية' : ' EGP'}'),
                          const SizedBox(
                            width: 9,
                          ),
                          CustomTextLineThrough(
                              text: SharedPreferencesClass.getLanguageCode() ==
                                      'ar'
                                  ? '${offer.priceBeforDiscount.toString()} جنية'
                                  : '${offer.priceBeforDiscount.toString()} EGP',
                              textColor: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildPriceContainer({required String text}) {
    return Container(
      height: 24,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: const BoxDecoration(
        color: ColorConstants.mainColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 13),
        textAlign: TextAlign.center,
      )),
    );
  }

  // build outings
  _buildSubCategoryOutings(ThemeData theme) {
    return SizedBox(
        height: 84,
        child: Obx(() => (controller.subCategories.isNotEmpty)
            ? ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: controller.subCategories.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 210,
                    child: GestureDetector(
                      onTap: () {
                        controller.getOffersForSubCategories(
                          subCategoryId:
                              controller.subCategories[index].id.toString(),
                        );
                        Get.to(() => OfferListForSubCategoryPage(
                              mainCategoryName:
                                  controller.subCategories[index].enName,
                            ));
                      },
                      child: Container(
                          clipBehavior: Clip.hardEdge,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Get.isDarkMode
                                ? ColorConstants.gray700
                                : Colors.grey.shade200,
                            border: Border.all(
                                color: Get.isDarkMode
                                    ? Colors.transparent
                                    : Colors.grey.shade200,
                                width: 1),
                          ),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 210,
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl: ApiConstants.storageURL +
                                      controller.subCategories[index].imageUrl
                                          .toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withAlpha(110),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 17,
                                        bottom: 8,
                                        right: 17,
                                      ),
                                      child: Align(
                                        alignment: SharedPreferencesClass
                                                    .getLanguageCode() ==
                                                'ar'
                                            ? Alignment.bottomRight
                                            : Alignment.bottomLeft,
                                        child: SizedBox(
                                          height: 28,
                                          child: Text(
                                              SharedPreferencesClass
                                                          .getLanguageCode() ==
                                                      'ar'
                                                  ? controller
                                                      .subCategories[index]
                                                      .arName
                                                      .toString()
                                                  : controller
                                                      .subCategories[index]
                                                      .enName
                                                      .toString(),
                                              style: theme.textTheme.headline6!
                                                  .copyWith(
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          )),
                    ),
                  );
                })
            : _shimmerForListViewForOffer(height: 160)));
  }

  // build section title, show all btn
  Widget _buildSection(
      {required String title,
      required dynamic onPressed,
      required ThemeData theme}) {
    return Padding(
      padding: EdgeInsets.only(
          left: SharedPreferencesClass.getLanguageCode() == 'ar' ? 0.0 : 16.0,
          right: SharedPreferencesClass.getLanguageCode() == 'ar' ? 16.0 : 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.subtitle1?.copyWith(
                fontWeight: FontWeight.bold, fontSize: 15, height: 1.1),
          ),
          SizedBox(
            height: 28,
            child: MaterialButton(
              onPressed: onPressed,
              minWidth: 50,
              splashColor: theme.primaryColor.withAlpha(10),
              highlightColor: theme.primaryColor.withAlpha(30),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80)),
              child: Row(
                children: [
                  Text(
                    SharedPreferencesClass.getLanguageCode() == 'ar'
                        ? 'عروض أكثر'
                        : 'More offers',
                    style: const TextStyle(
                        color: ColorConstants.mainColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: ColorConstants.mainColor,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // build list of categories
  Widget _buildCategories(ThemeData theme) {
    List<String> categoryImageIcon = [
      'assets/images/outings.png',
      'assets/images/eats_drinks.png',
      'assets/images/entertainment.png',
      'assets/images/services.png',
    ];
    return SizedBox(
        height: 116,
        child: Obx(() => ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: controller.mainCategories.length,
            itemBuilder: (context, index) {
              return _buildCategory(
                  category: controller.mainCategories[index],
                  imageIcon: categoryImageIcon[index],
                  index: index,
                  theme: theme);
            })));
  }

  // build category
  Widget _buildCategory(
      {required CategoryModel category,
      required String imageIcon,
      required index,
      required theme}) {
    return GestureDetector(
      onTap: () {
        controller.getOffersForMainCategories(
          categoryId: category.id.toString(),
        );
        Get.to(() => OfferListForMainCategoryPage(
              mainCategoryName: SharedPreferencesClass.getLanguageCode() == 'ar'
                  ? category.arName
                  : category.enName,
              offers: controller.offersForMainCategory,
            ));
      },
      child: ZoomTapAnimation(
        beginDuration: const Duration(milliseconds: 300),
        endDuration: const Duration(milliseconds: 500),
        child: Container(
          width: 112,
          height: 118,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.only(
              right: SharedPreferencesClass.getLanguageCode() == 'ar' ? 0 : 8,
              left: SharedPreferencesClass.getLanguageCode() == 'ar' ? 8 : 0),
          child: Stack(
            children: [
              Container(
                width: 120,
                height: 118,
                child: CachedNetworkImage(
                  imageUrl: ApiConstants.storageURL + category.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(110),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imageIcon,
                          width: 23,
                          height: 23,
                          color: Colors.white,
                        ),
                        Text(
                          SharedPreferencesClass.getLanguageCode() == 'ar'
                              ? category.arName
                              : category.enName,
                          textAlign: Controllers
                              .directionalityController.textAlign.value,
                          style: theme.textTheme.subtitle1?.copyWith(
                              color: Colors.white, fontSize: 13.0, height: 1.2, fontWeight:FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationCategory({required theme}) {
    return GestureDetector(
      onTap: () {},
      child: ZoomTapAnimation(
        beginDuration: const Duration(milliseconds: 300),
        endDuration: const Duration(milliseconds: 500),
        child: Container(
          width: 132,
          height: 116,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.only(
              right: SharedPreferencesClass.getLanguageCode() == 'ar' ? 16 : 0,
              left: SharedPreferencesClass.getLanguageCode() == 'ar' ? 0 : 16),
          child: Stack(
            children: [
              Container(
                width: 132,
                height: 118,
                child: Image.asset(
                  'assets/images/location_category.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(110),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/location.png',
                          width: 23,
                          height: 23,
                          color: Colors.white,
                        ),
                        Text(
                          SharedPreferencesClass.getLanguageCode() == 'ar'
                              ? 'العروض القريبة منك'
                              : 'Offers near you',
                          textAlign: Controllers
                              .directionalityController.textAlign.value,
                          style: theme.textTheme.subtitle1?.copyWith(
                              color: Colors.white, fontSize: 9.5, height: 1.2,fontWeight:FontWeight.bold),
                        ),
                        Container(
                          width: 112,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              )),
                          child: Text(
                            SharedPreferencesClass.getLanguageCode() == 'ar'
                                ? 'اكتشف الأماكن'
                                : 'Explore places',
                            style: const TextStyle(
                                color: ColorConstants.mainColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // build list of offers
  Widget _buildTheStrongestOffers(
      {required List<OfferModel> offerModels, required ThemeData theme}) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        padding: EdgeInsets.only(
            left: SharedPreferencesClass.getLanguageCode() == 'ar' ? 0 : 16,
            right: SharedPreferencesClass.getLanguageCode() == 'ar' ? 16 : 0,
            top: 0,
            bottom: 0),
        scrollDirection: Axis.horizontal,
        itemCount: offerModels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: SharedPreferencesClass.getLanguageCode() == 'ar' ? 0 : 8,
                left: SharedPreferencesClass.getLanguageCode() == 'ar' ? 8 : 0),
            child: OfferCard(
              offerModel: offerModels[index],
              width: 265,
              height: 204,
            ),
          );
        },
      ),
    );
  }

  Widget _buildNewOfferCard(
      {required List<OfferModel> offerModels,
      required ThemeData theme,
      required BuildContext context}) {
    return SizedBox(
        height: 123,
        child: CarouselSlider.builder(
            carouselController: controller.carouselNewOfferController,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              aspectRatio: 1,
              initialPage: 0,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              onPageChanged: (index, reason) =>
                  controller.changeBannerNewOffer(index),
            ),
            itemCount: offerModels.length,
            itemBuilder: (BuildContext contextCarousel, int itemIndex,
                int pageViewIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        right: 16,
                        // SharedPreferencesClass.getLanguageCode() == 'ar'
                        //     ? 0
                        //     : 8,
                        left: 16,
                        // SharedPreferencesClass.getLanguageCode() == 'ar'
                        //     ? 8
                        //     : 0
                    ),
                    child: NewOfferCard(
                      offerModel: offerModels[itemIndex],
                      width: MediaQuery.of(context).size.width,
                      // 336,
                      height: 123,
                    ),
              );
            }));
  }

  // build list of offers
  Widget _buildMostSellerOffers(
      {required List<OfferModel> offerModels, required ThemeData theme}) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        padding: EdgeInsets.only(
            left: SharedPreferencesClass.getLanguageCode() == 'ar' ? 0 : 16,
            right: SharedPreferencesClass.getLanguageCode() == 'ar' ? 16 : 0,
            top: 0,
            bottom: 0),
        scrollDirection: Axis.horizontal,
        itemCount: offerModels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: SharedPreferencesClass.getLanguageCode() == 'ar' ? 0 : 8,
                left: SharedPreferencesClass.getLanguageCode() == 'ar' ? 8 : 0),
            child: MostSellerOfferCard(
              offerModel: offerModels[index],
              width: 265,
              height: 200,
            ),
          );
        },
      ),
    );
  }

  // shimmer for offer's list
  Widget _shimmerForListViewForOffer({required double height}) {
    return ShimmerListView(
      width: 262,
      height: height,
      topPadding: 0,
      bottomPadding: 0,
      leftPadding: SharedPreferencesClass.getLanguageCode() == 'ar' ? 4 : 0,
      rightPadding: SharedPreferencesClass.getLanguageCode() == 'ar' ? 0 : 4,
    );
  }
}
