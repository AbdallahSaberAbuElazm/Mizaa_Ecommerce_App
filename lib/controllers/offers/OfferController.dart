import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce_app/shared/constants/ColorConstants.dart';

class OfferController extends GetxController with StateMixin {
  // final OfferProvider _offerProvider;
  
  // ProductController(this._offerProvider);

  final TextEditingController quantityController = TextEditingController();

  var count = 1.obs;

  late PageController pageController;
  late CarouselController carouselController;

  // for offer images carousel
  var currentPage = 0.obs;
  var currentBanner = 0.obs;

  // app bar
  late ScrollController scrollOfferDescriptionController;
  final isScrolledOfferDescription = false.obs;
  final appBarOfferDescriptionColor = Colors.transparent.obs;
  final appBarItemContainerOfferDescriptionColor = Colors.white.obs;
  final appBarItemOfferDescriptionColor = ColorConstants.mainColor.obs;

  @override
  void onInit() {
    quantityController.text = count.value.toString();
    carouselController = CarouselController();
    scrollOfferDescriptionController = ScrollController()
      ..addListener(_onScrollOfferDescription);
    super.onInit();

  }
  
  // void fetchOffer(int id) {
  //   change(null, status: RxStatus.loading());
  //
  //
  //   _offerProvider.getOfferById(id).then((offer) {
  //     change(offer, status: RxStatus.success());
  //   }).catchError((error) {
  //     change(null, status: RxStatus.error(error));
  //   });
  // }

  void _onScrollOfferDescription() {
    if (scrollOfferDescriptionController.offset > 80 && !isScrolledOfferDescription.value) {

      isScrolledOfferDescription.value = true;
      appBarOfferDescriptionColor.value = Colors.white;
      appBarItemContainerOfferDescriptionColor.value = ColorConstants.mainColor;
      appBarItemOfferDescriptionColor.value = Colors.white;

    } else if (scrollOfferDescriptionController.offset <= 80 && isScrolledOfferDescription.value) {

      isScrolledOfferDescription.value = false;
      appBarOfferDescriptionColor.value = Colors.transparent;
      appBarItemContainerOfferDescriptionColor.value = Colors.white;
      appBarItemOfferDescriptionColor.value =  ColorConstants.mainColor;

    }
  }


  void increment() {
    count.value++;

    quantityController.text = count.value.toString();
  }

  void decrement() {
    if (count.value == 1) return;
    count.value--;

    quantityController.text = count.value.toString();
  }

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  void changeBanner(int index) {
    currentBanner.value = index;
  }

  @override
  void dispose() {
    scrollOfferDescriptionController.dispose();
    super.dispose();
  }

}
