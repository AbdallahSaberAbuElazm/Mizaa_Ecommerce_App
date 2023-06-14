import 'package:get/get.dart';
import 'package:test_ecommerce_app/controllers/home/HomeBinding.dart';
import 'package:test_ecommerce_app/views/authentication/otp_login_screen.dart';
import 'package:test_ecommerce_app/views/authentication/recover_password.dart';
import 'package:test_ecommerce_app/views/authentication/register.dart';
import 'package:test_ecommerce_app/views/authentication/splash_screen.dart';
import 'package:test_ecommerce_app/views/authentication/user_location_screen.dart';
import 'package:test_ecommerce_app/views/home/HomePage.dart';
import 'package:test_ecommerce_app/views/offer/OfferDescriptionPage.dart';
import 'package:test_ecommerce_app/controllers/user/user_authentication_binding.dart';


class Routes {
  static const INITIAL = '/splash';

  static final routes = [
    GetPage(
      name: '/splash', 
      page: () => const SplashScreen(),
      binding: UserAuthenticationBinding(),
      transitionDuration: const Duration(seconds: 1),
      transition: Transition.upToDown,
    ),
    GetPage(
        name: '/userLocationScreen',
        page: () =>  UserLocationScreen(),
        binding: UserAuthenticationBinding()
    ),
    GetPage(
      name: '/login', 
      page: () =>  OTPLoginScreen(),
      binding: UserAuthenticationBinding(),
    ),
    GetPage(
      name: '/register',
      page: () =>  Register(),
      binding: UserAuthenticationBinding(),
    ),
    GetPage(
      name: '/recovery',
      page: () =>  RecoverPassword(),
      binding: UserAuthenticationBinding(),
    ),
    GetPage(
      name: '/home', 
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/product/:id',
      page: () => OfferDescriptionPage(offerModel: Get.find(),),
      // binding: OfferBinding(),
    ),
    // GetPage(name: '/offerListForMainCategory', page: ()=>const OfferListForMainCategoryPage(), )
  ];
}
