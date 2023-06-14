import 'package:flutter/material.dart';
import 'package:test_ecommerce_app/shared/constants/ColorConstants.dart';
import 'package:test_ecommerce_app/controllers/controllers.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce_app/shared/utils.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Utils.direction,
      child: SafeArea(
        child: Container(
          color: ColorConstants.backgroundContainer,
          child: Center(
            child: Text('Favorite'),
          ),
        ),
      ),
    );
  }
}