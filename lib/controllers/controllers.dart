

import 'package:get/get.dart';
import 'package:test_ecommerce_app/controllers/theme/directionality_controller.dart';
import 'package:test_ecommerce_app/controllers/user/user_authentication_controller.dart';

class Controllers {
  static UserAuthenticationController userAuthenticationController = UserAuthenticationController(Get.find());
  static DirectionalityController directionalityController = DirectionalityController();
}