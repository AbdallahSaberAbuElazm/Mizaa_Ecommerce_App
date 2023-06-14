import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final Color textColor;
  final Color btnBackgroundColor;
  final double textSize;
  final dynamic btnOnpressed;
  const CustomButton({Key? key, required this.btnText,required this.textSize,required this.textColor,required this.btnBackgroundColor, required this.btnOnpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: btnBackgroundColor,elevation: 0, shape:
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                )
            ),
            onPressed: btnOnpressed, child: Text(btnText,style: TextStyle(
            color: textColor,
            fontSize: textSize,fontFamily: 'Noto Kufi Arabic',
            fontWeight: FontWeight.w600
        ),)));
  }
}
