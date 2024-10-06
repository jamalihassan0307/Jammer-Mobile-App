// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/view_model/controllers/cart/cart_controller.dart';
import 'package:jammer_mobile_app/view_model/controllers/home/home_controller.dart';
import 'package:jammer_mobile_app/view_model/controllers/order/order_controller.dart';
import 'package:jammer_mobile_app/view_model/controllers/wishlist/wishlist_controller.dart';
import 'package:jammer_mobile_app/res/components/functions/passDataToProduct.dart';
import 'package:jammer_mobile_app/models/banner/banner_model.dart';
import 'package:jammer_mobile_app/view/pages/product/product.dart';
import 'package:jammer_mobile_app/view/pages/home/search.dart';
// import 'package:jammer_mobile_app/models/banner_model.dart';
import 'package:jammer_mobile_app/utils/carousel_pro/lib/carousel_pro.dart';
import 'package:badges/badges.dart' as badges;
import 'package:fluttertoast/fluttertoast.dart';

// My Own Import
import 'package:jammer_mobile_app/res/components/home_page_component/drawer.dart';
// import 'package:jammer_mobile_app/view/pages/home_page_component/best_offer_grid.dart';
// import 'package:jammer_mobile_app/view/pages/home_page_component/top_seller_grid.dart';
import 'package:jammer_mobile_app/res/components/home_page_component/best_deal.dart';
import 'package:jammer_mobile_app/res/components/home_page_component/featured_brands.dart';
import 'package:jammer_mobile_app/res/components/home_page_component/CouponsDeals.dart';
// import 'package:jammer_mobile_app/view/pages/home_page_component/best_of_fashion.dart';
// import 'package:jammer_mobile_app/view/pages/home_page_component/womens_collection.dart';
import 'package:jammer_mobile_app/view/pages/home/notifications.dart';
import 'package:jammer_mobile_app/view/pages/category/top_offers.dart';
import 'package:jammer_mobile_app/view/pages/cart/cart.dart';
import 'package:jammer_mobile_app/repository/loading.dart';
// import 'package:jammer_mobile_app/view/pages/search.dart/';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime? currentBackPressTime;

  @override
  void initState() {
    Get.put(HomeController());
    Get.put(CartController());
    Get.put(OrderController());
    Get.put(WishListController());
    if (HomeController.to.category.isEmpty) {
      HomeController.to.init();
      CartController.to.init();
      OrderController.to.init();
      WishListController.to.init();
    }

    super.initState();
  }

  Widget build(BuildContext context) {
    // OrderController.to.init();
    return GetBuilder<HomeController>(builder: (obj) {
      return obj.loading
          ? ProgressLoading()
          : RefreshIndicator(
              onRefresh: () => Future(() {
                obj.init();
              }),
              color: Colors.blue,
              child: Scaffold(
                backgroundColor: const Color(0xFFF1F3F6),
                appBar: AppBar(
                  title: const Text(
                    'GoKart',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  titleSpacing: 0.0,
                  backgroundColor: Theme.of(context).primaryColor,
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.search),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchPage()));
                      },
                    ),
                    IconButton(
                      icon: badges.Badge(
                        badgeContent: const Text('2'),
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: Theme.of(context).primaryColorLight,
                        ),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Notifications()),
                        );
                      },
                    ),
                    GetBuilder<CartController>(builder: (obj) {
                      return IconButton(
                        icon: badges.Badge(
                          badgeContent: Text(obj.numberofcart.toString()),
                          badgeStyle: badges.BadgeStyle(
                            badgeColor: Theme.of(context).primaryColorLight,
                          ),
                          child: const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: const CartPage()));
                        },
                      );
                    }),
                  ],
                ),

                // Drawer Code Start Here

                drawer: const MainDrawer(),

                // Drawer Code End Here
                body: PopScope(
                  canPop: false,
                  onPopInvoked: (bool key) {
                    bool backStatus = onWillPop();
                    if (backStatus) {
                      exit(0);
                    }
                  },
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    body: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: <Widget>[
                        // Slider Code Start Here
                        if (obj.bannerList.isNotEmpty)
                          SizedBox(
                            height: 220.0,
                            child: Carousel(
                              onImageTap: (v) {
                                BannerModel model = obj.bannerList[v];

                                Color bg =
                                    beautifulColors[v % beautifulColors.length];
                                if (model.link == 1) {
                                  obj
                                      .getBannerProduct(
                                          model.linkId!, model.couponId!)
                                      .then((value) {
                                    if (obj.bannerProduct != null) {
                                      PassDataToProduct product = PassDataToProduct(
                                          obj.bannerProduct!.productName,
                                          obj.bannerProduct!.productId,
                                          obj.bannerProduct!.imagePaths,
                                          obj.bannerProduct!.discountedPrice
                                              .toString(),
                                          obj.bannerProduct!.price.toString(),
                                          obj.bannerProduct!.discountType ==
                                                  "FLAT"
                                              ? "OFF ${obj.bannerProduct!.discount}"
                                              : "OFF ${obj.bannerProduct!.discount} %",
                                          "");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ProductPage(
                                                  bg: bg,
                                                  productData: product,
                                                  coupon: model.couponId!)));
                                    } else {
                                      print("product is nullllllllllll");
                                    }
                                  });
                                } else if (model.link == 2) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TopOffers(
                                                couponid: model.couponId,
                                                title: "Banner Products",
                                                id: model.linkId.toString(),
                                              )));
                                }
                              },
                              images: obj.bannerList
                                  .map((e) => NetworkImage(GetImage(e.image!)))
                                  .toList(),
                              dotSize: 4.0,
                              dotSpacing: 15.0,
                              dotColor: Colors.lightGreenAccent,
                              indicatorBgPadding: 5.0,
                              dotBgColor: Colors.purple.withOpacity(0.0),
                              boxFit: BoxFit.fill,
                              animationCurve: Curves.fastOutSlowIn,
                            ),
                          ),

                        TopCouponProducts(),
                        // Featured Brand Slider End Here

                        const SizedBox(
                          height: 6.0,
                        ),

                        // const Divider(
                        //   height: 1.0,
                        // ),

                        // const SizedBox(
                        //   height: 6.0,
                        // ),

                        // // Slider Code End Here

                        // const SizedBox(
                        //   height: 5.0,
                        // ),

                        // // Category Grid Start Here
                        // CategoryGrid(),

                        // Category Grid End Here

                        Container(
                          padding: const EdgeInsets.all(12.0),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'Top Coupon Products',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),

                        // Best Offer Grid Start Here

                        // BestOfferGrid(),

                        // // Best Offer Grid End Here
                        // const SizedBox(
                        //   height: 4.0,
                        // ),

                        // const Divider(
                        //   height: 1.0,
                        // ),

                        // const SizedBox(
                        //   height: 4.2,
                        // ),

                        // Top Seller Grid Start Here
                        // TopSeller(),
                        // // Top Seller Grid End Here

                        // const SizedBox(
                        //   height: 3.8,
                        // ),

                        // const Divider(
                        //   height: 1.0,
                        // ),

                        // const SizedBox(
                        //   height: 4.0,
                        // ),

                        // Best Deal Grid Start Here
                        BestDealGrid(),

                        // Promotion 1 Start Here
                        InkWell(
                          onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const TopOffers(
                            //             title: 'Top Selling Android Mobile')),
                            //   );
                          },
                          child: const Image(
                            image:
                                AssetImage('assets/promotion/promotion1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Promotion 1 End Here

                        // Best Deal Grid End Here

                        const SizedBox(
                          height: 3.8,
                        ),

                        const Divider(
                          height: 1.0,
                        ),

                        const SizedBox(
                          height: 8.0,
                        ),

                        // Featured Brand Slider Start Here

                        // Block Buster Deals Start Here
                        CouponsDeals(),
                        // Block Buster Deals End Here

                        // const SizedBox(
                        //   height: 6.0,
                        // ),

                        // const Divider(
                        //   height: 1.0,
                        // ),

                        // const SizedBox(
                        //   height: 0.0,
                        // ),

                        //Best of Fashion Start Here
                        // const BestOfFashion(),
                        //Best of Fashion End Here

                        // const SizedBox(
                        //   height: 6.0,
                        // ),

                        // const Divider(
                        //   height: 1.0,
                        // ),

                        // const SizedBox(
                        //   height: 0.0,
                        // ),

                        // const WomensCollection(),

                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return false;
    } else {
      return true;
    }
  }
}
