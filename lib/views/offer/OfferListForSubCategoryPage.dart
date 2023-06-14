import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce_app/controllers/home/HomeController.dart';
import 'package:test_ecommerce_app/controllers/offers/OfferController.dart';
import 'package:test_ecommerce_app/models/offers/OfferModel.dart';
import 'package:test_ecommerce_app/shared/constants/ColorConstants.dart';
import 'package:test_ecommerce_app/shared/shared_preferences.dart';
import 'package:test_ecommerce_app/controllers/controllers.dart';
import 'package:test_ecommerce_app/shared/utils.dart';
import 'package:test_ecommerce_app/views/widgets/shimmer_container.dart';
import 'package:test_ecommerce_app/views/offer/OfferCard.dart';
import 'package:test_ecommerce_app/views/offer/OfferDescriptionPage.dart';

class OfferListForSubCategoryPage extends StatefulWidget {
  final String mainCategoryName;
  const OfferListForSubCategoryPage({Key? key, required this.mainCategoryName,})
      : super(key: key);

  @override
  State<OfferListForSubCategoryPage> createState() =>
      _OfferListForSubCategoryPageState();
}

class _OfferListForSubCategoryPageState
    extends State<OfferListForSubCategoryPage>  with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Utils.direction,
      child: Scaffold(
        backgroundColor: ColorConstants.backgroundContainer,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorConstants.backgroundContainer,
          toolbarHeight: 78,
          leading:  _buildLeadingAppBar() ,leadingWidth: 260,
          actions:[ Padding(
            padding: EdgeInsets.only(
                right: SharedPreferencesClass.getLanguageCode() == 'ar' ? 0 : 16,
                left: SharedPreferencesClass.getLanguageCode() == 'ar' ? 16 : 0),
            child: _buildActionsAppBar(context: context),
          )],
          bottom:  TabBar(padding: EdgeInsets.only(left: 16,right: 16),
            controller: _tabController,
            labelColor: ColorConstants.mainColor, // Change the selected tab text color
            unselectedLabelColor: ColorConstants.black0, // Change the unselected tab text color
            dividerColor: ColorConstants.mainColor,
            indicatorColor: ColorConstants.mainColor,
            tabs: [
              Tab(child:Text(SharedPreferencesClass.getLanguageCode() == 'ar'?'العروض':'Offers', style: const TextStyle(fontFamily: 'Noto Kufi Arabic',fontSize:15,fontWeight: FontWeight.w700),)),
              Tab(child:Text( SharedPreferencesClass.getLanguageCode() == 'ar'?'التجار':'Merchants', style: const TextStyle(fontFamily: 'Noto Kufi Arabic',fontSize:15,fontWeight: FontWeight.w700))),
            ],
          ),
        ),
        body:
        Padding(
          padding: const EdgeInsets.only(top: 27),
          child: TabBarView(
            controller: _tabController,
            children: [
              OfferTab(),
              MerchantTab(),
            ],
          ),
        ),


    ));
  }



  Widget _buildActionsAppBar({required BuildContext context}) {
    return
      Row(
        children: [
          appBarIcon(icon: Icons.search, iconColor: ColorConstants.mainColor),
          const SizedBox(
            width: 8,
          ),
          appBarIcon(
              icon: Icons.notifications, iconColor: ColorConstants.mainColor),
          const SizedBox(
            width: 8,
          ),
          appBarIcon(
              icon: Icons.shopping_cart_rounded,
              iconColor: ColorConstants.mainColor),
        ],

      );
  }

  Widget _buildLeadingAppBar(){
    return  Padding(
      padding: EdgeInsets.only(
          right: SharedPreferencesClass.getLanguageCode() == 'ar' ? 16 : 0,
          left: SharedPreferencesClass.getLanguageCode() == 'ar' ? 16 : 0),
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Row(
          children: [
            Container(
              width: 37,
              height: 37,
              decoration: const BoxDecoration(
                color: ColorConstants.mainColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.mainCategoryName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Noto Kufi Arabic',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }


  Widget appBarIcon({required IconData icon, required Color iconColor}) {
    return Icon(
      icon,
      color: iconColor,
      size: 25,
    );
  }

}

class OfferTab extends StatefulWidget {

  const OfferTab({Key? key,})
      : super(key: key);
  @override
  State<OfferTab> createState() => _OfferTabState();
}

class _OfferTabState extends State<OfferTab> {
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return
      Padding(padding: const EdgeInsets.only(left: 16, right: 16,bottom: 5),child:
      _buildListOfOffers());


  }

  Widget _buildListOfOffers() {
    return  Obx(() => homeController.isLoadingOffersSubCategory.value
        ? ListView.builder(

      itemCount: 2,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: ShimmerContainer(
            width: MediaQuery.of(context).size.width,
            height: 250,
            topPadding: 0,
            bottomPadding: 0,
            rightPadding: 0,
            leftPadding: 0),
      ),
    )
        : homeController.offersForSubCategory.isNotEmpty
        ? ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: homeController.offersForSubCategory.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.put(OfferController());
              Get.to(() => OfferDescriptionPage(
                  offerModel:
                  homeController.offersForSubCategory[index]));
            },
            child: OfferCard(
              offerModel:
              homeController.offersForSubCategory[index],
              width: 265,
              height: 230,
            ),
          );
        })
        : const Center(
      child: Text(
        'No data yet',
        style: TextStyle(fontSize: 18),
      ),
    ));
  }
}

class MerchantTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('soon'),
    );
  }
}
