import 'package:flutter/material.dart';
import 'package:test_ecommerce_app/shared/constants/ColorConstants.dart';
import 'package:test_ecommerce_app/controllers/controllers.dart';
import 'package:test_ecommerce_app/shared/shared_preferences.dart';
import 'package:test_ecommerce_app/shared/utils.dart';

class CustomPasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  CustomPasswordFormField(
      {Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool _passwordVisible = false;
  String _passwordErrorText = '';

  @override
  void initState() {
    super.initState();
    Utils.direction = Utils.getDirection(
        (SharedPreferencesClass.getLanguageCode() == null ||
                SharedPreferencesClass.getLanguageCode() == '')
            ? 'ar'
            : SharedPreferencesClass.getLanguageCode().toString());
    TextAlign textAlign =
        Utils.getTextAlign(SharedPreferencesClass.getLanguageCode().toString());
  }

  void _validatePassword(String password) {
    if (password.length < 4) {
      setState(() {
        _passwordErrorText = SharedPreferencesClass.getLanguageCode() == 'ar'
            ? 'يجب أن تكون كلمة المرور على الأقل 4 أحرف'
            : 'Password must be at least 4 characters long.';
      });
    } else {
      setState(() {
        _passwordErrorText = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Utils.direction,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.hintText,
            style: TextStyle(
                fontSize: 18,
                color: ColorConstants.black0,
                fontFamily: 'Noto Kufi Arabic',
                height: 1),
            textAlign: Controllers.directionalityController.textAlign.value),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 54,
          child: TextFormField(
            scrollPadding: EdgeInsets.zero,
            cursorColor: Colors.black,
            controller: widget.controller,
            textDirection: Utils.direction,
            validator: (value) {
              if (value!.length < 4) {
                return SharedPreferencesClass.getLanguageCode() == 'ar'
                    ? 'يجب أن تكون كلمة المرور على الأقل 4 أحرف'
                    : 'Password must be at least 4 characters long.';
              }
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              isDense: true,
              fillColor: Colors.black,
              focusColor: Colors.black,
              hoverColor: Colors.black,
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorConstants.greyColor, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorConstants.greyColor, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              // errorText: _passwordErrorText,
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.subtitle2,
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  (_passwordVisible == true)
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.black, size: 22,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
            onChanged: _validatePassword,
            obscureText: !_passwordVisible,
            enableSuggestions: false,
            autocorrect: false,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: Utils.textAlign,
          ),
        ),
        (widget.controller.text.isNotEmpty && widget.controller.text.length < 4)
            ? Text(
                _passwordErrorText,
                style: const TextStyle(
                    color: ColorConstants.mainColor, fontSize: 11),
              )
            : const SizedBox(),
      ]),
    );
  }
}
