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
import 'package:test_ecommerce_app/views/widgets/custom_text_btn.dart';
import 'package:test_ecommerce_app/views/widgets/phone_number_field.dart';

class OTPLoginScreen extends GetView<UserAuthenticationController> {
  bool enableBtn = false;
  bool isAPICallProcess = false;
  final UserAuthenticationController userAuthenticationController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.loginListenerTextEditingController();
    return Directionality(
      textDirection: Utils.direction!,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
            body: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(top: 35, right: 16, left: 16),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Utils.buildLogo(),
                const SizedBox(height: 22),
                BuildIntroText(
                  headerText: SharedPreferencesClass.getLanguageCode() == 'ar'
                      ? 'ميزتها في خصوماتها!'
                      : 'Mizaa in its Discount',
                ),
                const SizedBox(height: 35),
                PhoneNumberField(
                  controller: controller.phoneNumberController,
                  countries: controller.countries,
                  headerName: SharedPreferencesClass.getLanguageCode() == 'ar'
                      ? 'رقم الموبايل'
                      : 'Phone number',
                ),
                const SizedBox(height: 4),
                CustomPasswordFormField(
                  hintText: SharedPreferencesClass.getLanguageCode() == 'ar'
                      ? 'كلمة المرور'
                      : 'Password',
                  controller: controller.passwordController,
                ),
                const SizedBox(height: 6),
                recoverPassword(),
                const SizedBox(height: 6),
                loginBtn(context: context),
                const SizedBox(height: 14),
                Center(
                  child: Text(
                    SharedPreferencesClass.getLanguageCode() == 'ar'
                        ? 'ليس لديك حساب ؟'
                        : "Don't have an account?",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Noto Kufi Arabic',
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 14),
                createAccount(),
                const SizedBox(height: 6),
                goToHomePage(),
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget loginBtn({required BuildContext context}) {
    return Obx(
      () => CustomButton(
          btnText: SharedPreferencesClass.getLanguageCode() == 'ar'
              ? 'تسجيل الدخول'
              : 'Login',
          textColor: Colors.white,
          textSize: 17,
          btnBackgroundColor: ColorConstants.mainColor,
          btnOnpressed: (controller.isButtonEnabled.value && Controllers.userAuthenticationController.passwordErrorText.isEmpty)
              ? () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                        context: context,
                        builder: (context) => const Center(
                                child: CircularProgressIndicator(
                              color: ColorConstants.mainColor,
                            )));
                    controller.otpLogin(
                        mobileNo: controller.phoneNumberController.text,
                        password: controller.passwordController.text,
                        context: context);
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

  Widget skipBtn() {
    return CustomButton(
        btnText:
            SharedPreferencesClass.getLanguageCode() == 'ar' ? 'تخطي' : 'Skip',
        textColor: Colors.black,
        textSize: 17,
        btnBackgroundColor: ColorConstants.btnBackgroundGrey,
        btnOnpressed: () {
          Get.offAllNamed('/home');
          controller.phoneNumberController.text = '';
          controller.passwordController.text = '';
        });
  }

  Widget createAccount() {
    return CustomButton(
        btnText: SharedPreferencesClass.getLanguageCode() == 'ar'
            ? 'انشاء حساب ميزة'
            : 'Create a mizza account',
        textColor: Colors.black,
        textSize: 17,
        btnBackgroundColor: ColorConstants.btnBackgroundGrey,
        btnOnpressed: () {
          controller.phoneNumberController.text = '';
          controller.passwordController.text = '';
          Get.toNamed('/register');
        });
  }

  Widget recoverPassword() {
    return Center(
        child: CustomTextBtn(
            btnText: SharedPreferencesClass.getLanguageCode() == 'ar'
                ? 'نسيت كلمة المرور'
                : "Forgot your password",
            textColor: ColorConstants.mainColor,
            fontSize: 15,
            btnOnPressed: () {
              controller.phoneNumberController.text = '';
              controller.passwordController.text = '';
              Get.toNamed('/recovery');
            }));
  }

  Widget goToHomePage() {
    return Center(
        child: CustomTextBtn(
            btnText: SharedPreferencesClass.getLanguageCode() == 'ar'
                ? 'الذهاب إلى الرئيسية'
                : "Go to home page",
            textColor: ColorConstants.mainColor,
            fontSize: 15,
            btnOnPressed: () {
              Get.offNamed('/home');
            }));
  }
}
