import 'package:flutter/material.dart';
import 'package:test_ecommerce_app/controllers/offers/OfferController.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce_app/models/companies/CompanyModel.dart';
import 'package:test_ecommerce_app/models/offers/OfferModel.dart';
import 'package:test_ecommerce_app/shared/constants/ColorConstants.dart';
import 'package:test_ecommerce_app/shared/shared_preferences.dart';
import 'package:test_ecommerce_app/views/offer/OfferDescriptionPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_ecommerce_app/services/networking/ApiConstants.dart';
import 'package:test_ecommerce_app/views/widgets/custom_text_line_through.dart';
import 'package:test_ecommerce_app/views/offer/widget/merchant_logo.dart';

class OfferCard extends StatefulWidget {
  final OfferModel offerModel;
  final double width;
  final double height;
  const OfferCard(
      {Key? key,
      required this.offerModel,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  late CompanyModel companyModel;
  @override
  void initState() {
    companyModel = CompanyModel.fromJson(widget.offerModel.company!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
        onTap: () {
          Get.put(OfferController());
          Get.to(() => OfferDescriptionPage(offerModel: widget.offerModel));
        },
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Stack(
            children: <Widget>[
          Align(
          alignment: Alignment.topCenter,child: _buildOfferImage()),
              Align(
                alignment: Alignment.bottomCenter,
                  child: _buildOfferDetailContainer()),
            ],
          ),
        ));
  }

  // offer Image
  Widget _buildOfferImage() {
    return Container(
      height: widget.height / 2 + 24,
      width: double.infinity,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft:Radius.circular(12), topRight: Radius.circular(12)),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            '${ApiConstants.storageURL}${widget.offerModel.mainImage.toString()}',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 14, left: 18, right: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 29,
                height: 29,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorConstants.backgroundContainer),
                child: const Icon(
                  Icons.favorite_border_outlined,
                  color: ColorConstants.mainColor,
                  size: 22,
                )),
            _buildPriceContainer(text: '${widget.offerModel.enDiscount}%'),
          ],
        ),
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

  // offer detail
  Widget _buildOfferDetailContainer() {
    return
      Transform.translate(
        offset: const Offset(0, -14.5),
        child:
        Container(
          width: double.infinity,
          height: widget.height / 2+2,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MerchantLogo(merchantLogo:  companyModel.logo.toString(),
                      containerWidth: 43, containerHeight: 43,
                      logoWidth: 25, logoHeight: 25),
                  const SizedBox(
                    width: 9,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 22,
                        child: Text(
                          SharedPreferencesClass.getLanguageCode() == 'ar'
                              ? companyModel.arName.toString()
                              : companyModel.enName.toString(),
                          style: TextStyle(
                              fontSize: 13, color: ColorConstants.greyColor),
                        ),
                      ),
                      SizedBox(
                        height: 28,
                        width: widget.width - 73,
                        child: Text(
                          SharedPreferencesClass.getLanguageCode() == 'ar'
                              ? widget.offerModel.arTitle.toString()
                              : widget.offerModel.enTitle.toString(),
                          style: TextStyle(
                              fontSize: 12, color: ColorConstants.black0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 2,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildPriceContainer(
                      text: '${widget.offerModel.priceAfterDiscount.toString()}${SharedPreferencesClass.getLanguageCode() == 'ar'
                          ? ' جنية': ' EGP'}'),
                  const SizedBox(width: 9,),
                  CustomTextLineThrough(
                    text: SharedPreferencesClass.getLanguageCode() == 'ar'
                        ? '${widget.offerModel.priceBeforDiscount.toString()} جنية'
                        : '${widget.offerModel.priceBeforDiscount.toString()} EGP',textColor:ColorConstants.greyColor
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
