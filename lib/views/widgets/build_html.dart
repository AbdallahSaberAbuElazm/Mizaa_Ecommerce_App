import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class BuildHtml extends StatelessWidget {
  final String htmlData;
  const BuildHtml({Key? key, required this.htmlData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(
      data: htmlData,
      // Customize the rendering of the HTML data with optional parameters
      // For example:
      // style: {
      //   'body': Style(fontSize: FontSize(20.0)),
      //   'p': Style(margin: EdgeInsets.all(8.0)),
      // },
    );
  }
}
