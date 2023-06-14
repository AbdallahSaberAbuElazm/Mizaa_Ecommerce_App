import 'package:test_ecommerce_app/controllers/offers/OfferController.dart';
import 'package:test_ecommerce_app/providers/ProductProvider.dart';
import 'package:test_ecommerce_app/repositories/ProductRepository.dart';
import 'package:get/get.dart';

class OfferBinding implements Bindings {
  @override
  void dependencies() {  
    Get.lazyPut<ProductRepository>(() => ProductRepository(Get.find()));
    Get.lazyPut<ProductProvider>(() => ProductProvider(Get.find()));
    
    Get.lazyPut<OfferController>(() => OfferController());
  }
}
