import 'package:flutter/material.dart';
import 'package:test_ecommerce_app/controllers/controllers.dart';
import 'package:test_ecommerce_app/controllers/user/user_authentication_controller.dart';
import 'package:test_ecommerce_app/shared/constants/ColorConstants.dart';
import 'package:test_ecommerce_app/shared/shared_preferences.dart';
import 'package:test_ecommerce_app/shared/utils.dart';
import 'package:test_ecommerce_app/views/authentication/otp_login_screen.dart';
import 'package:test_ecommerce_app/views/widgets/build_intro_text.dart';
import 'package:test_ecommerce_app/views/widgets/custom_button.dart';
import 'package:test_ecommerce_app/views/widgets/custom_password_form_field.dart';
import 'package:test_ecommerce_app/views/widgets/custom_text_btn.dart';
import 'package:test_ecommerce_app/views/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce_app/views/widgets/custom_check_box.dart';
import 'package:test_ecommerce_app/views/widgets/phone_number_field.dart';
import 'package:test_ecommerce_app/views/widgets/custom_confirm_password_field.dart';

class Register extends GetView<UserAuthenticationController> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.registerListenerTextEditingController();
    Controllers.directionalityController.isPasswordAndConfirmPasswordMatched.value = false;
    print('agree policy register ${controller.isChecked.value} && ${controller.isButtonEnabled.value}');
    return WillPopScope(
      onWillPop: ()async{
        controller.clearRegisterTextFieldData();
        Get.offAllNamed('/login');
        return true;
      },
      child: SafeArea(
        child:Directionality(
          textDirection: Utils.direction,
          child: Scaffold(
              backgroundColor: Colors.white,
            appBar:  AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                toolbarHeight: 80,
                leadingWidth: 200,
                leading:   Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: GestureDetector(
                    onTap: (){
                      controller.clearRecoveryTextFieldData();
                      Get.offAllNamed('/login');
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 37,height: 37,
                          decoration:const BoxDecoration(
                            color: ColorConstants.mainColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.arrow_back_ios_rounded,color: Colors.white,size: 20,),
                        ),
                        const SizedBox(width: 10,),
                         Text( SharedPreferencesClass.getLanguageCode() == 'ar'
                            ? 'رجوع'
                            : "Back",style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,fontFamily: 'Noto Kufi Arabic',
                            fontWeight: FontWeight.w600
                        ),)
                      ],
                    ),
                  ),
                ),
              actions: [Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Utils.buildLogo(),
              ),],
              ),
              body: Form(
                key: _formKey,
                child: Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only( right: 16, left: 16),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                       BuildIntroText(
                        headerText:SharedPreferencesClass.getLanguageCode() == 'ar'
                            ? 'انشاء حساب': 'Create an acount',
                      ),
                      const SizedBox(height: 24),
                      CustomTextFormField(
                          name: SharedPreferencesClass.getLanguageCode() == 'ar'
                              ?'اسم المستخدم'
                              : "User name" ,
                          type: TextInputType.name,
                          controller: controller.firstNameController,
                          lines: 1),
                      const SizedBox(height: 24),

                      PhoneNumberField(controller: controller.phoneNumberController,countries: controller.countries,headerName: SharedPreferencesClass.getLanguageCode() == 'ar'
                          ? 'رقم الموبايل':'Phone number',),
                      const SizedBox(height: 4),
                      CustomPasswordFormField(
                        hintText:  SharedPreferencesClass.getLanguageCode() == 'ar'
                            ? 'كلمة المرور'
                            : "Password",
                        controller: controller.passwordController,
                      ),
                      const SizedBox(height: 24),
                      CustomConfirmPasswordFormField(
                        hintText:
                        SharedPreferencesClass.getLanguageCode() == 'ar'
                            ? 'تأكيد كلمة المرور'
                            : "Confirm password",
                        controller: controller.confirmPasswordController,
                        passwordController: controller.passwordController,
                      ),

                      // const SizedBox(height: 24),
                      buildConditions(context: context),
                      const SizedBox(height: 20),
                      registerBtn(context),
                      const SizedBox(height: 24),
                      // loginBtn(),

                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  Widget buildConditions({required BuildContext context}){
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      height: 54,
      child: Row(
        children: [
            CustomCheckBox(text:SharedPreferencesClass.getLanguageCode() == 'ar'
               ? 'أوافق على':'I agree'),
          CustomTextBtn(btnText:SharedPreferencesClass.getLanguageCode() == 'ar'
              ? 'شروط المستخدم والخصوصية':'User Terms and Privacy', textColor: ColorConstants.mainColor,fontSize: 14, btnOnPressed: (){})
        ],
      ),
    );
  }

  Widget registerBtn(BuildContext context) {
    return Obx(()=>CustomButton(
          btnText: 'انشاء حساب',
          textColor: Colors.white,
          textSize: 17,
          btnBackgroundColor: ColorConstants.mainColor,
          btnOnpressed:(controller.isButtonEnabled.value == true && Controllers.userAuthenticationController.isChecked.value == true &&  Controllers.userAuthenticationController.passwordErrorText.isEmpty)? () async {
            if(_formKey.currentState!.validate() ){

                  showDialog(context: context, builder: (context)=>const Center(child:  CircularProgressIndicator(color: ColorConstants.mainColor,)));
                  controller.register(
                    mobileNo:controller.phoneNumberController.text,
                    firstName:controller.firstNameController.text,
                    password: controller.passwordController.text, context: context,
                  );

          }else{
              controller.phoneNumberController.addListener(() {_formKey.currentState!.validate();});
              controller.passwordController.addListener(() {_formKey.currentState!.validate();});
            }}:null),
    );
  }

  Widget loginBtn() {
    return CustomButton(
        btnText: 'تسجيل الدخول',
        textColor: Colors.black,
        textSize: 17,
        btnBackgroundColor: ColorConstants.btnBackgroundGrey,
        btnOnpressed: () {
          Get.offAll(()=>  OTPLoginScreen());
        });
  }


}
