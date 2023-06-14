// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test_ecommerce_app/shared/constants/ColorConstants.dart';
// import 'package:test_ecommerce_app/views/widgets/build_intro_text.dart';
// import 'package:test_ecommerce_app/views/widgets/custom_button.dart';
// import 'package:test_ecommerce_app/views/widgets/custom_text_form_field.dart';
//
// class PhoneNumberScreen extends StatefulWidget {
//
//   PhoneNumberScreen({Key? key});
//   @override
//   _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
// }
//
// class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
//   String mobileNumber = '';
//   bool enableBtn = false;
//   bool isAPICallProcess = false;
//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     super.initState();
//     mobileNumber = '';
//   }
//
//   @override
//   void dispose() {
//     passwordController.dispose();
//     phoneNumberController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Scaffold(
//             body: Form(
//               key: _formKey,
//               child: Container(
//                 alignment: Alignment.topRight,
//                 margin: const EdgeInsets.only(top: 90, right: 32, left: 32),
//                 child: ListView(
//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const BuildIntroText(
//                       headerText: 'ميز خصوماتك الآن !',
//                     ),
//                     const SizedBox(height: 45),
//                     CustomTextFormField(
//                         name: 'رقم الموبايل',
//                         type: TextInputType.phone,
//                         controller: phoneNumberController,
//                         lines: 1),
//                     const SizedBox(height: 28),
//                     continueBtn(),
//                     const SizedBox(height: 28),
//                     skipBtn(),
//                     // const SizedBox(height: 18),
//                     // const Center(
//                     //   child:  Text('ليس لديك حساب ؟',style: TextStyle(
//                     //       color: Colors.black,
//                     //       fontSize: 15,fontFamily: 'Noto Kufi Arabic',
//                     //       fontWeight: FontWeight.w500
//                     //   ),),
//                     // ),
//                     // const SizedBox(height: 18),
//                     //
//                     // createAccount(),
//                   ],
//                 ),
//               ),
//             )),
//       ),
//     );
//   }
//
//   Widget continueBtn() {
//     return CustomButton(
//         btnText: 'متابعة',
//         textColor: Colors.white,
//         btnBackgroundColor: ColorConstants.mainColor,
//         btnOnpressed: () async {
//
//           if(_formKey.currentState!.validate()){
//               Get.toNamed('/login');
//             }
//         });
//   }
//
//   Widget skipBtn() {
//     return CustomButton(
//         btnText: 'تخطي',
//         textColor: Colors.black,
//         btnBackgroundColor: ColorConstants.btnBackgroundGrey,
//         btnOnpressed: () {
//           Get.offNamed('/home');
//         });
//   }
// }
