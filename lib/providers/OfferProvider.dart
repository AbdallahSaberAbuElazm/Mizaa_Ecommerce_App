import 'package:test_ecommerce_app/models/offers/OfferModel.dart';
import 'package:test_ecommerce_app/repositories/OfferRepository.dart';

class OfferProvider {
  final OfferRepository _offerRepository;

  OfferProvider(this._offerRepository);

  Future<List<OfferModel>> getCarouselOffers({required String cityId}) async {
    var offers = await _offerRepository.getCarouselOffers(cityId: cityId);
    return offers.map((offer) {
      return  OfferModel.fromJson(offer.toJson());
    }).toList();
  }

  Future<List<OfferModel>> getTodayOffers({required String cityId}) async {
    var offers = await _offerRepository.getTodayOffers(cityId: cityId);

    return offers.map((offer) => OfferModel.fromJson(offer.toJson())).toList();
  }

  Future<List<OfferModel>> getSpecialOffers({required String cityId}) async {
    var offers = await _offerRepository.getSpecialOffers(cityId: cityId);

    return offers.map((offer) => OfferModel.fromJson(offer.toJson())).toList();
  }

  Future<List<OfferModel>> getMostSalesOffers({required String cityId}) async {
    var offers = await _offerRepository.getMostSalesOffers(cityId: cityId);

    return offers.map((offer) => OfferModel.fromJson(offer.toJson())).toList();
  }

  Future<List<OfferModel>> getOffersForMainCategories({required String categoryId, required String city}) async {
    var offers = await _offerRepository.getOffersForMainCategories(categoryId: categoryId,city: city);

    return offers.map((offer) => OfferModel.fromJson(offer.toJson())).toList();
  }

  Future<List<OfferModel>> getOffersForSubCategories({required String subCategoryId, required String city}) async {
    var offers = await _offerRepository.getOffersForSubCategories(subCategoryId: subCategoryId,city: city);

    return offers.map((offer) => OfferModel.fromJson(offer.toJson())).toList();
  }

  // Future<OfferModel> getOfferById(int id) async {
  //   var offer = await _offerRepository.getOfferId(id);
  //
  //   return OfferModel.fromJson(offer);
  // }



}
