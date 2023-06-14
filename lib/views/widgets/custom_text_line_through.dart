import 'package:flutter/material.dart';

class CustomTextLineThrough extends StatelessWidget {
  final String text;
  final Color textColor;
  const CustomTextLineThrough({Key? key,required this.text, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      style:
       TextStyle(fontSize: 13, color: textColor, decoration: TextDecoration.lineThrough),
    );
  }
}
