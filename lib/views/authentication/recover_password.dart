import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce_app/controllers/controllers.dart';
import 'package:test_ecommerce_app/controllers/user/user_authentication_controller.dart';
import 'package:test_ecommerce_app/shared/constants/ColorConstants.dart';
import 'package:test_ecommerce_app/shared/shared_preferences.dart';
import 'package:test_ecommerce_app/shared/utils.dart';
import 'package:test_ecommerce_app/views/widgets/build_intro_text.dart';
import 'package:test_ecommerce_app/views/widgets/custom_button.dart';
import 'package:test_ecommerce_app/views/widgets/custom_password_form_field.dart';
import 'package:test_ecommerce_app/views/widgets/custom_confirm_password_field.dart';
import 'package:test_ecommerce_app/views/widgets/phone_number_field.dart';

class RecoverPassword extends GetView<UserAuthenticationController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.recoveryListenerTextEditingController();
    Controllers.directionalityController.isPasswordAndConfirmPasswordMatched.value = false;

    return WillPopScope(
      onWillPop: () async {
        controller.clearRecoveryTextFieldData();
        Get.offAllNamed('/login');
        return true;
      },
      child: SafeArea(
        child:Directionality(
          textDirection: Utils.direction,
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                toolbarHeight: 90,
                leadingWidth: 200,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: GestureDetector(
                    onTap: () {
                      controller.clearRecoveryTextFieldData();
                      Get.offAllNamed('/login');
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 37,
                          height: 37,
                          decoration: const BoxDecoration(
                            color: ColorConstants.mainColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          SharedPreferencesClass.getLanguageCode() == 'ar'
                              ? 'رجوع'
                              : "Back",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Noto Kufi Arabic',
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Utils.buildLogo(),
                  ),
                ],
              ),
              body: Form(
                key: _formKey,
                child: Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 16, left: 16),
                  child: ListView(
                    children: [
                      BuildIntroText(
                        headerText:
                            SharedPreferencesClass.getLanguageCode() == 'ar'
                                ? 'إعادة تغيير كلمة المرور'
                                : 'Re-set password',
                      ),
                      const SizedBox(height: 40),
                      PhoneNumberField(
                        controller: controller.phoneNumberController,
                        countries: controller.countries,
                        headerName:  SharedPreferencesClass.getLanguageCode() == 'ar'
                            ? 'رقم الموبايل':'Phone number',
                      ),
                      const SizedBox(height: 4),
                      CustomPasswordFormField(
                        hintText:
                            SharedPreferencesClass.getLanguageCode() == 'ar'
                                ? 'كلمة المرور'
                                : "Password",
                        controller: controller.passwordController,
                      ),
                      const SizedBox(height: 20),
                      CustomConfirmPasswordFormField(
                        hintText:
                            SharedPreferencesClass.getLanguageCode() == 'ar'
                                ? 'تأكيد كلمة المرور'
                                : "Confirm password",
                        controller: controller.confirmPasswordController,
                        passwordController: controller.passwordController,
                      ),
                      const SizedBox(height: 27),
                      recoverPasswordBtn(context),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  Widget recoverPasswordBtn(BuildContext context) {
    return Obx(
      () => CustomButton(
          btnText: 'استمرار',
          textColor: Colors.white,
          textSize: 17,
          btnBackgroundColor: ColorConstants.mainColor,
          btnOnpressed: (controller.isButtonEnabled.value)
              ? () async {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                        context: context,
                        builder: (context) => const Center(
                                child: CircularProgressIndicator(
                              color: ColorConstants.mainColor,
                            )));
                    controller.recoverPassword(
                      password: controller.passwordController.text,
                      mobileNo: controller.phoneNumberController.text,
                      context: context,
                    );
                  } else {
                    controller.phoneNumberController.addListener(() {
                      _formKey.currentState!.validate();
                    });
                    controller.passwordController.addListener(() {
                      _formKey.currentState!.validate();
                    });
                  }
                }
              : null),
    );
  }
}
