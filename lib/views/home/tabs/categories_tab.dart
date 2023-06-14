import 'package:flutter/material.dart';
import 'package:test_ecommerce_app/shared/constants/ColorConstants.dart';
import 'package:test_ecommerce_app/controllers/controllers.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce_app/shared/utils.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: Utils.direction,child: Container(
      color: ColorConstants.backgroundContainer,
    ));
  }
}
