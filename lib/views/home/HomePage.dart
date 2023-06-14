import 'package:test_ecommerce_app/controllers/home/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:test_ecommerce_app/shared/shared_preferences.dart';
import 'package:test_ecommerce_app/controllers/controllers.dart';
import 'package:test_ecommerce_app/shared/utils.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../shared/constants/ColorConstants.dart';

class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);

  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: Utils.direction,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          notchMargin: 10,
          child: Container(
            height: 67,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomAppBarItem(icon: Icons.home_rounded,text:SharedPreferencesClass.getLanguageCode() == 'ar'?  'العروض':'Offers',page: 0),
                _bottomAppBarItem(icon: Icons.shopping_basket,text:SharedPreferencesClass.getLanguageCode() == 'ar'?  'طلباتي':'Orders', page: 1),
                _bottomAppBarItem(icon: Icons.category_rounded,text:SharedPreferencesClass.getLanguageCode() == 'ar'?  'تصنيفات':'Categories', page: 2),
                _bottomAppBarItem(icon: Icons.favorite,text:SharedPreferencesClass.getLanguageCode() == 'ar'?  'المفضلة':'Favourite', page: 3),
                _bottomAppBarItem(icon: Icons.person ,text:SharedPreferencesClass.getLanguageCode() == 'ar'?  'حسابي':'Profile', page: 4),
              ],
            ),
          )),
        ),
        body: PageView(
          controller: _homeController.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ..._homeController.pages
          ],
        )
      ),
    );
  }

  Widget _bottomAppBarItem({required IconData icon,required String text,required  int page}) {
    return SizedBox(
      height: 50,
      child: ZoomTapAnimation(
        onTap: () => _homeController.goToTab(page),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Icon(icon, color: _homeController.currentPage == page ? ColorConstants.mainColor : ColorConstants.navBarIconColor, size: 25,),
            Text(text, style: TextStyle(color:_homeController.currentPage == page ? ColorConstants.mainColor : ColorConstants.navBarIconColor, fontSize: 10.5, fontWeight: FontWeight.bold ),)
          ],
        ),
      ),
    );
  }
}
