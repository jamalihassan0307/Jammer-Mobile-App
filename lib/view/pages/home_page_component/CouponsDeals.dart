// ignore_for_file: must_be_immutable

// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/controllers/home_controller.dart';
import 'package:jammer_mobile_app/controllers/wishlist_controller.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
import 'package:jammer_mobile_app/functions/passDataToProduct.dart';
import 'package:jammer_mobile_app/models/GetCouponsWithProducts%20.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/category/top_offers.dart';
import 'package:jammer_mobile_app/view/pages/home_page_component/best_deal.dart';
import 'package:jammer_mobile_app/view/pages/product/product.dart';

class CouponsDeals extends StatefulWidget {
  const CouponsDeals({super.key});

  @override
  State<CouponsDeals> createState() => _CouponsDealsState();
}

class _CouponsDealsState extends State<CouponsDeals> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      "assets/top_design/block_buster_deals.jpg",
      "assets/top_design/best_of_fashion.jpg",
      "assets/top_design/womens_collection.jpg"
    ];
    String getSequentialImage(int index) {
      final imageIndex = index % list.length;
      return list[imageIndex];
    }

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<HomeController>(builder: (obj) {
      return SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: obj.couponproductlist.length,
              itemBuilder: (BuildContext context, int index) {
                GetCouponsWithProducts model = obj.couponproductlist[index];
                return SizedBox(
                  width: double.infinity,
                  height:
                      model.products.length >= 4 ? height * 0.7 : height * 0.42,
                  child: Column(
                    children: [
                      TopImage(
                        couponid: model.coupon.id,
                        id: model.coupon.id.toString(),
                        image: getSequentialImage(index),
                        title: model.coupon.code.toString(),
                      ),
                      OfferGrid(coupon: model, index: index),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}

class TopImage extends StatelessWidget {
  TopImage({
    super.key,
    required this.image,
    required this.title,
    required this.id,
    required this.couponid,
  });
  String image;
  String title;
  String id;
  int couponid;

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        SizedBox(
          height: height * 0.1,
          width: width,
          child: Image(
            fit: BoxFit.fitHeight,
            image: AssetImage(image),
          ),
        ),
        Positioned(
          top: 40.0,
          // left: 20.0,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0.0),
            width: width,
            height: 50.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.black,
                          width: 0.2,
                        ),
                      ),
                      child: const Text(
                        'View All',
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TopOffers(
                                  title: title,
                                  id: id,
                                  couponid: couponid,
                                  coupon: true,
                                )),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OfferGrid extends StatelessWidget {
  OfferGrid({super.key, required this.coupon, required this.index});
  GetCouponsWithProducts coupon;
  int index;

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        SizedBox(
          width: width,
          height: coupon.products.length >= 4 ? height * 0.6 : height * 0.32,
          child: Stack(
            children: <Widget>[
              Container(
                width: width,
                height:
                    coupon.products.length >= 4 ? height * 0.57 : height * 0.3,
                decoration: BoxDecoration(
                  color: index != 1
                      ? Color(0xFFF83850)
                      : const Color.fromARGB(255, 6, 90, 158),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding:
                      const EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
                  width: width - 20.0,
                  margin:
                      const EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      crossAxisCount: 2,
                      childAspectRatio: ((width) / 550),
                    ),
                    itemCount: coupon.products.length >= 4
                        ? 4
                        : coupon.products.length,
                    primary: false,
                    itemBuilder: (BuildContext context, int index) {
                      Products data = coupon.products[index];

                      Color bg =
                          beautifulColors[index % beautifulColors.length];
                      return InkWell(
                        child: Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: bg,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Container(
                                        margin: const EdgeInsets.all(6.0),
                                        height: 150.0,
                                        child: data.imagePaths.length == 0
                                            ? Image(
                                                image: AssetImage(
                                                    "assets/download5.jpg"),
                                                fit: BoxFit.fitHeight,
                                              )
                                            : Image.network(
                                                StaticVariables.baseurl +
                                                    data.imagePaths[0],
                                                fit: BoxFit.fitHeight,
                                              ),
                                      ),
                                    ),
                                  ),
                                  GetBuilder<WishListController>(
                                      builder: (obj) {
                                    return InkWell(
                                      onTap: () {
                                        if (!obj.wishList.any((element) =>
                                            element.productId ==
                                            data.productId)) {
                                          obj.color = Colors.red;
                                          PassDataToProduct products =
                                              PassDataToProduct(
                                                  data.productName,
                                                  data.productId,
                                                  [],
                                                  data.price.toString(),
                                                  data.price.toString(),
                                                  "d",
                                                  "d");
                                          obj.AddWishList(
                                              products, coupon.coupon.id);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "Added to Wishlist")));
                                        } else {
                                          obj.color = Colors.grey;
                                          obj.removeWishList(obj.wishList
                                              .where((element) =>
                                                  element.productId ==
                                                  data.productId)
                                              .firstOrNull!
                                              .id);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "Remove from Wishlist")));
                                        }
                                      },
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            backgroundColor: obj.wishList.any(
                                                    (element) =>
                                                        element.productId ==
                                                        data.productId)
                                                ? Colors.white.withOpacity(0.5)
                                                : Colors.grey.shade800
                                                    .withOpacity(0.5),
                                            radius: 17,
                                            child: Icon(
                                              obj.wishList.any((element) =>
                                                      element.productId ==
                                                      data.productId)
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: obj.wishList.any(
                                                      (element) =>
                                                          element.productId ==
                                                          data.productId)
                                                  ? Colors.red
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      data.productName,
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: height * 0.01),
                                    data.discountType == "FLAT"
                                        ? RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'RS ${data.discountedPrice}  ',
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15.0),
                                                ),
                                                TextSpan(
                                                  text: 'RS ${data.price} ',
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13.0,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      ' RS ${data.discountedPrice}',
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0),
                                                ),
                                                TextSpan(
                                                  text:
                                                      ' ${data.discount}% OFF',
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 13.0),
                                                ),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          PassDataToProduct model = PassDataToProduct(
                              data.productName,
                              data.productId,
                              data.imagePaths,
                              data.discountedPrice.toString(),
                              data.price.toString(),
                              data.description.toString(),
                              data.discountType == "FLAT"
                                  ? "OFF ${data.discount}"
                                  : "OFF ${data.discount} %");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductPage(
                                    productData: model,
                                    coupon: coupon.coupon.id,
                                    bg: bg)),
                          );
                        },
                      );

                      // InkWell(
                      //   child: Container(
                      //     margin: const EdgeInsets.all(5.0),
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(10.0),
                      //       boxShadow: const [
                      //         BoxShadow(
                      //           blurRadius: 5.0,
                      //           color: Colors.grey,
                      //         ),
                      //       ],
                      //     ),
                      //     child: Column(
                      //       children: <Widget>[
                      //         Container(
                      //           margin: const EdgeInsets.all(6.0),
                      //           height: 150.0,
                      //           child: data.imagePaths.length == 0
                      //               ? Image(
                      //                   image:
                      //                       AssetImage("assets/download5.jpg"),
                      //                   fit: BoxFit.fitHeight,
                      //                 )
                      //               : Image.network(
                      //                   StaticVariables.baseurl +
                      //                       data.imagePaths[0],
                      //                   fit: BoxFit.fitHeight,
                      //                 ),
                      //         ),
                      //         Container(
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: <Widget>[
                      //               Text(
                      //                 data.productName,
                      //                 style: const TextStyle(fontSize: 12.0),
                      //               ),
                      //               SizedBox(
                      //                 height: height * 0.06,
                      //                 // color: Colors.pink,
                      //                 child: Text(
                      //                   data.description,
                      //                   style: TextStyle(

                      //                       // overflow: TextOverflow.fade,
                      //                       color: Color(0xFF67A86B),
                      //                       fontSize: 15.0),
                      //                   textAlign: TextAlign.center,
                      //                   maxLines: 2,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // );
                    },
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
