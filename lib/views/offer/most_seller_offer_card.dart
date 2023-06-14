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
import 'package:test_ecommerce_app/views/offer/widget/merchant_logo.dart';

class MostSellerOfferCard extends StatefulWidget {
  final OfferModel offerModel;
  final double width;
  final double height;
  const MostSellerOfferCard(
      {Key? key,
        required this.offerModel,
        required this.width,
        required this.height})
      : super(key: key);

  @override
  State<MostSellerOfferCard> createState() => _MostSellerOfferCardState();
}

class _MostSellerOfferCardState extends State<MostSellerOfferCard> {
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
            children: [
              Column(
                children: <Widget>[
                  _buildOfferImage(),
                  _buildOfferDetailContainer(),
                ],
              ),
              Transform.translate(
                offset: const Offset(0,-10),
                child: Align(
                  alignment: Alignment.center,
                  child: MerchantLogo(merchantLogo:  companyModel.logo.toString(),
                      containerWidth: 43, containerHeight: 43,
                      logoWidth: 25, logoHeight: 25),

                ),
              ),
            ],
          ),
        ));
  }

  // offer Image
  Widget _buildOfferImage() {
    return Container(
      height: widget.height / 2 + 27,
      width: double.infinity,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            '${ApiConstants.storageURL}${widget.offerModel.mainImage.toString()}',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 14, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorConstants.backgroundContainer),
                child: const Icon(
                  Icons.favorite_border_outlined,
                  color: ColorConstants.mainColor,
                  size: 19,
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
    return Transform.translate(
        offset: const Offset(0, -19),
        child: Container(
          width: double.infinity,
          height: widget.height / 2,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                      const SizedBox(height: 7,),
                      SizedBox(
                        height: 50,
                        width: widget.width/1.75,
                        child: Text(
                          SharedPreferencesClass.getLanguageCode() == 'ar'
                              ? widget.offerModel.arTitle.toString()
                              : widget.offerModel.enTitle.toString(),
                          style: TextStyle(
                              fontSize: 12, color: ColorConstants.black0,height: 1.2),
                        ),
                      ),
                    ],
                  ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildPriceContainer(
                      text: '${widget.offerModel.priceAfterDiscount.toString()}${SharedPreferencesClass.getLanguageCode() == 'ar'
                          ? ' جنية': ' EGP'}'),
                  const SizedBox(height: 2,),

                  Text(
                    SharedPreferencesClass.getLanguageCode() == 'ar'
                        ? '${widget.offerModel.priceBeforDiscount.toString()} جنية'
                        : '${widget.offerModel.priceBeforDiscount.toString()} EGP',
                    style: TextStyle(
                        fontSize: 13, color: ColorConstants.greyColor,decoration: TextDecoration.lineThrough,),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
