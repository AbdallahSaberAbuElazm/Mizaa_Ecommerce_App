import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce_app/controllers/controllers.dart';
import 'package:test_ecommerce_app/models/location/city/CityModel.dart';
import 'package:test_ecommerce_app/models/location/country/CountryModel.dart';
import 'package:test_ecommerce_app/providers/user_authentication_provider.dart';
import 'package:test_ecommerce_app/shared/shared_preferences.dart';
import 'package:test_ecommerce_app/views/authentication/otp_verifiy_screen.dart';
import 'package:test_ecommerce_app/models/user/user_login_data.dart';
import 'package:test_ecommerce_app/shared/utils.dart';

class UserAuthenticationController extends GetxController {
  final UserAuthenticationProvider userAuthenticationProvider;
  UserAuthenticationController(this.userAuthenticationProvider);

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // agree policy for register page
  final isChecked = false.obs;

  final otpController = ''.obs;
  final isButtonEnabled = false.obs;

  final selectedCountryPhoneCode = '002'.obs;
  final selectedCountryPhoneLength = 11.obs;

  final countries = <CountryModel>[].obs;
  final cities = <CityModel>[].obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    firstNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  ///////////////////////////////////////////////
  loginListenerTextEditingController() {
    phoneNumberController.addListener(updateButtonStateLoginScreen);
    passwordController.addListener(updateButtonStateLoginScreen);
  }

  recoveryListenerTextEditingController() {
    phoneNumberController.addListener(updateButtonStateRecoveryScreen);
    passwordController.addListener(updateButtonStateRecoveryScreen);
    confirmPasswordController.addListener(updateButtonStateRecoveryScreen);
  }

  registerListenerTextEditingController() {
    phoneNumberController.addListener(updateButtonStateRegisterScreen);
    firstNameController.addListener(updateButtonStateRegisterScreen);
    passwordController.addListener(updateButtonStateRegisterScreen);
    confirmPasswordController.addListener(updateButtonStateRegisterScreen);
  }

  void updateButtonStateLoginScreen() {
    isButtonEnabled.value = phoneNumberController.text.isNotEmpty && phoneNumberController.text.length == selectedCountryPhoneLength.value  &&
        passwordController.text.isNotEmpty;
  }

  void updateButtonStateRegisterScreen() {
    isButtonEnabled.value = phoneNumberController.text.isNotEmpty && phoneNumberController.text.length == selectedCountryPhoneLength.value  &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty && passwordController.text.isNotEmpty ==
        confirmPasswordController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty;
  }

  void updateButtonStateRecoveryScreen() {
    isButtonEnabled.value = phoneNumberController.text.isNotEmpty && phoneNumberController.text.length == selectedCountryPhoneLength.value  &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
  }

  ///////////
  //update isChecked agree policy in register
  updateIsChecked({required bool isCheckedValue}){
    isChecked.value = isCheckedValue;
    update();
  }

  ///////////////////////////////////////////////

  void clearLoginTextFieldData() {
    phoneNumberController.text = '';
    passwordController.text = '';
  }

  void clearRecoveryTextFieldData() {
    phoneNumberController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';
  }

  void clearRegisterTextFieldData() {
    phoneNumberController.text = '';
    firstNameController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';
  }

  ///////////////////////////////////////////////

  void getCountries() {
    userAuthenticationProvider.getCountries().then((value) {
      countries.value = value;
      Controllers.directionalityController.updateCountries(countriesData: value);
    });
  }

  void getCities({required String countryId}) {
    userAuthenticationProvider.getCites(id: countryId).then((value) {
      cities.value = value;
      Controllers.directionalityController.updateCities(citiesData: value);
    });
  }

  void otpLogin(
      {required String mobileNo,
      required String password,
      required BuildContext context}) {
    userAuthenticationProvider
        .otpLogin(mobileNo: mobileNo, password: password)
        .then((userService) {
      Get.back();
      if (userService.firstName != '') {
        SharedPreferencesClass.setUserData(
            userLoginData: UserLoginData(
                firstName: userService.firstName,
                phoneNumber: userService.phoneNumber,
                token: userService.token));

        isButtonEnabled.value = false;
        Get.offNamed('/home');
        clearLoginTextFieldData();
      } else {
        Utils.snackBar(context: context, msg:SharedPreferencesClass.getLanguageCode() == 'ar'?  'بيانات الدخول غير صحيحة': 'Login information is incorrect');
      }
    });
  }

  void recoverPasswordOtp(
      {required String password,
      required String mobileNo,
      required String otp,
      required BuildContext context}) {
    userAuthenticationProvider
        .recoverPasswordOtp(password: password, mobile: mobileNo, otp: otp)
        .then((value) {
      Get.back();
      if (value['isSuccess'] == true) {
        Utils.snackBar(context: context, msg: SharedPreferencesClass.getLanguageCode() == 'ar'?value['message']:value['enmessage']);
        Get.offAllNamed('/login');
      } else {
        Utils.snackBar(context: context, msg: SharedPreferencesClass.getLanguageCode() == 'ar'?value['message']:value['enmessage']);
      }
    });
  }

  void recoverPassword(
      {required String password,
      required String mobileNo,
      required BuildContext context}) {
    userAuthenticationProvider
        .recoverPassword(password: password, mobile: mobileNo)
        .then((value) {
      Get.back();
      if (value['isSuccess'] == true) {
        isButtonEnabled.value = false;
        clearRecoveryTextFieldData();
        Get.to(() => OTPVerifyScreen(
              data: {'mobileNo': mobileNo, 'password': password},
              routeName: 'recover',
            ));
      } else {
        Utils.snackBar(context: context, msg: 'تأكد من صحة بياناتك');
      }
    });
  }

  void register(
      {required String mobileNo,
      required String firstName,
      required String password,
      required BuildContext context}) {
    userAuthenticationProvider
        .register(
      mobileNo: mobileNo,
      password: password,
      firstName: firstName,
    )
        .then((value) {
      Get.back();
      if (value['isAuthenticated'] == true) {
        isButtonEnabled.value = false;
        Get.to(() => OTPVerifyScreen(
              data: {
                'mobileNo': mobileNo,
                'password': password,
                'firstName': firstName
              },
              routeName: 'register',
            ));
        clearRegisterTextFieldData();
      } else {
        Utils.snackBar(context: context, msg: value['message']);
      }
    });
  }

  void registerOtp({
    required String mobileNo,
    required String firstName,
    required String password,
    required BuildContext context,
    required String otpCode,
  }) {
    userAuthenticationProvider
        .registerOtp(
            mobileNo: mobileNo,
            firstName: firstName,
            password: password,
            otpCode: otpCode)
        .then((value) {
      if (value['isAuthenticated'] == true) {
        otpController.value = '';
        Utils.snackBar(context: context, msg: SharedPreferencesClass.getLanguageCode() == 'ar'? 'تم انشاء حساب بنجاح':'An account has been created successfully');
        Get.offAllNamed('/login');
      } else {

          Get.back();
          Utils.snackBar(context: context, msg: SharedPreferencesClass.getLanguageCode() == 'ar'? 'الرمز الذي أدخلته غير صحيح' : 'The code you entered is incorrect');

      }
    });
  }
}
