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

class NewOfferCard extends StatefulWidget {
  final OfferModel offerModel;
  final double width;
  final double height;
  const NewOfferCard(
      {Key? key,
        required this.offerModel,
        required this.width,
        required this.height})
      : super(key: key);

  @override
  State<NewOfferCard> createState() => _NewOfferCardState();
}

class _NewOfferCardState extends State<NewOfferCard> {
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
          child:
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildOfferImage(),
                  _buildOfferDetailContainer(),
                ],
              ),
        ));
  }

  // offer Image
  Widget _buildOfferImage() {
    return Container(
      height: widget.height ,
      width: widget.width /2 -65,
      decoration: BoxDecoration(
        borderRadius:SharedPreferencesClass.getLanguageCode() == 'ar'?  BorderRadius.only( topRight: Radius.circular(12), bottomRight: Radius.circular(12)):BorderRadius.only( topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            '${ApiConstants.storageURL}${widget.offerModel.mainImage.toString()}',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 13, left: 10, right: 10,bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 55,
                child: _buildPriceContainer(text: '${widget.offerModel.enDiscount}%')),
            MerchantLogo(merchantLogo:  companyModel.logo.toString(),
                containerWidth: 38, containerHeight: 35,
                logoWidth: 22, logoHeight: 20),


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
       Container(
          width: widget.width/2 +29,
          height: widget.height,
          padding: const EdgeInsets.all(9),
          decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius:SharedPreferencesClass.getLanguageCode() == 'ar'?  BorderRadius.only( topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)): BorderRadius.only( topRight: Radius.circular(12), bottomRight: Radius.circular(12))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: widget.width/2 +9,
                height: widget.height-20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 22,
                            child: Text(
                              SharedPreferencesClass.getLanguageCode() == 'ar'
                                  ? companyModel.arName.toString()
                                  : companyModel.enName.toString(),
                              style: TextStyle(
                                  fontSize: 13, color: ColorConstants.greyColor,fontWeight: FontWeight.w500),
                            ),
                          ),
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
                        ],
                      ),

                    const SizedBox(height: 3,),
                    SizedBox(
                      height: 33,
                      width: widget.width/2 -20,
                      child: Text(
                        SharedPreferencesClass.getLanguageCode() == 'ar'
                            ? widget.offerModel.arTitle.toString()
                            : widget.offerModel.enTitle.toString(),
                        style: TextStyle(
                            fontSize: 12, color: ColorConstants.black0,height: 1.2,fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 3,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildPriceContainer(
                            text:  SharedPreferencesClass.getLanguageCode() == 'ar'
                                ? '${widget.offerModel.priceAfterDiscount.toString()} جنية'
                                : '${widget.offerModel.priceAfterDiscount.toString()} EGP',),
                          const SizedBox(width: 5,),
                        CustomTextLineThrough(
                          text:SharedPreferencesClass.getLanguageCode() == 'ar'
                              ? '${widget.offerModel.priceBeforDiscount.toString()} جنية'
                              : '${widget.offerModel.priceBeforDiscount.toString()} EGP',
                          textColor:ColorConstants.greyColor
                        )


                      ],
                    ),
                  ],
                ),
              ),


            ],
          ),
        );
  }
}
