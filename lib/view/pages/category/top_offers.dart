// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'dart:async' show Future, Timer;
// import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

// Controllers
import 'package:jammer_mobile_app/view_model/controllers/top_offer/TopOffers_controller.dart';
import 'package:jammer_mobile_app/view_model/controllers/home/home_controller.dart';
import 'package:jammer_mobile_app/view_model/controllers/wishlist/wishlist_controller.dart';

// Data and Functions
import 'package:jammer_mobile_app/res/app_url/static_variables.dart';
import 'package:jammer_mobile_app/res/components/functions/passDataToProduct.dart';

// Models
import 'package:jammer_mobile_app/models/Product/ProductsByCategory%20.dart';
import 'package:jammer_mobile_app/models/Product/RandamProduct.dart';

// Views
import 'package:jammer_mobile_app/res/components/home_page_component/best_deal.dart';
import 'package:jammer_mobile_app/view/pages/product/product.dart';

// My Own Imports
// import 'package:jammer_mobile_app/widget/loading.dart';

class TopOffers extends StatefulWidget {
  final String? title;
  final String? id;
  final bool? coupon;
  final int? couponid;

  const TopOffers({Key? key, this.title, this.id, this.coupon, this.couponid})
      : super(key: key);

  @override
  _TopOffersState createState() => _TopOffersState();
}

class _TopOffersState extends State<TopOffers> {
  @override
  void initState() {
    super.initState();
    Get.put(TopOfferController());
    if (widget.id == "0") {
    } else {
      TopOfferController.to
          .getproduct(widget.id!, widget.coupon == true ? true : false);
    }
    // Timer(const Duration(seconds: 3), () {
    //   setState(() {
    //     progress = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopOfferController>(
      builder: (obj) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(widget.title!),
              titleSpacing: 0.0,
            ),
            backgroundColor: const Color(0xFFF1F3F6),
            body: (obj.progress)
                ? Center(
                    child: SpinKitFoldingCube(
                      color: Theme.of(context).primaryColor,
                      size: 35.0,
                    ),
                  )
                : ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Deals of the Day(${widget.couponid == "0" ? HomeController.to.randomCouponProductslist.length : obj.couponproductlist.length} Results)',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Divider(
                        height: 1.0,
                      ),
                      if (widget.id == "0")
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: TopOffersGridView(
                            offers: HomeController.to.randomCouponProductslist,
                            couponid: widget.couponid!,
                          ),
                        ),
                      if (widget.id != "0")
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: OffersGridView(
                              offers: obj.couponproductlist,
                              couponid: widget.couponid!),
                        ),
                    ],
                  ));
      },
    );
  }
}

class OffersGridView extends StatefulWidget {
  final List<ProductsByCategory>? offers;
  final int couponid;

  const OffersGridView({Key? key, this.offers, required this.couponid})
      : super(key: key);

  @override
  _OffersGridViewState createState() => _OffersGridViewState();
}

class _OffersGridViewState extends State<OffersGridView> {
  InkWell getStructuredGridCell(
      ProductsByCategory offers, Color bg, height, width) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: bg, borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.all(15.0),
                      child: offers.imagePath.isEmpty
                          ? Image.asset(
                              "assets/best_deal/best_deal_1.jpg",
                              fit: BoxFit.contain,
                            )
                          : Image.network(
                              StaticVariables.baseurl + offers.imagePath[0],
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),
                ),
                GetBuilder<WishListController>(builder: (obj) {
                  return InkWell(
                    onTap: () {
                      if (!obj.wishList.any((element) =>
                          element.productId.toString() ==
                          offers.id.toString())) {
                        obj.color = Colors.red;
                        PassDataToProduct products = PassDataToProduct(
                            offers.name,
                            int.parse(offers.id),
                            [],
                            offers.price.toString(),
                            offers.price.toString(),
                            "d",
                            "d");
                        obj.AddWishList(products, 0);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Added to Wishlist")));
                      } else {
                        obj.color = Colors.grey;
                        obj.removeWishList(obj.wishList
                            .where((element) =>
                                element.productId.toString() ==
                                offers.id.toString())
                            .firstOrNull!
                            .id);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Remove from Wishlist")));
                      }
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: obj.wishList.any((element) =>
                                  element.productId.toString() ==
                                  offers.id.toString())
                              ? Colors.white.withOpacity(0.5)
                              : Colors.grey.shade800.withOpacity(0.5),
                          radius: 17,
                          child: Icon(
                            obj.wishList.any((element) =>
                                    element.productId.toString() ==
                                    offers.id.toString())
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: obj.wishList.any((element) =>
                                    element.productId.toString() ==
                                    offers.id.toString())
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
              margin: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    offers.name,
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "RS ${offers.price.toString()}",
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    offers.description.toString(),
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        PassDataToProduct product = PassDataToProduct(
            offers.name,
            int.tryParse(offers.id) ?? 0,
            offers.imagePath,
            offers.description,
            offers.price.toString(),
            "0",
            "");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductPage(
                  productData: product, coupon: widget.couponid, bg: bg)),
        );
      },
    );
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: List.generate(widget.offers!.length, (index) {
        Color bg = beautifulColors[index % beautifulColors.length];
        return getStructuredGridCell(widget.offers![index], bg, height, width);
      }),
    );
  }
}

class TopOffersGridView extends StatefulWidget {
  final List<RandomProducts>? offers;
  final int couponid;

  const TopOffersGridView({Key? key, this.offers, required this.couponid})
      : super(key: key);

  @override
  _TopOffersGridViewState createState() => _TopOffersGridViewState();
}

class _TopOffersGridViewState extends State<TopOffersGridView> {
  InkWell getStructuredGridCell(
      RandomProducts offers, Color bg, height, width) {
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
                      color: bg, borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.all(15.0),
                      child: offers.imagePaths.isEmpty
                          ? Image.asset(
                              "assets/best_deal/best_deal_1.jpg",
                              fit: BoxFit.contain,
                            )
                          : Image.network(
                              StaticVariables.baseurl + offers.imagePaths[0],
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),
                ),
                GetBuilder<WishListController>(builder: (obj) {
                  return InkWell(
                    onTap: () {
                      if (!obj.wishList.any((element) =>
                          element.productId.toString() == offers.productId)) {
                        obj.color = Colors.red;
                        PassDataToProduct products = PassDataToProduct(
                            offers.productName,
                            offers.productId,
                            [],
                            offers.price.toString(),
                            offers.price.toString(),
                            "d",
                            "d");
                        obj.AddWishList(products, offers.couponid!);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Added to Wishlist")));
                      } else {
                        obj.color = Colors.grey;
                        obj.removeWishList(obj.wishList
                            .where((element) =>
                                element.productId.toString() ==
                                offers.productId)
                            .firstOrNull!
                            .id);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Remove from Wishlist")));
                      }
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: obj.wishList.any((element) =>
                                  element.productId.toString() ==
                                  offers.productId)
                              ? Colors.white.withOpacity(0.5)
                              : Colors.grey.shade800.withOpacity(0.5),
                          radius: 17,
                          child: Icon(
                            obj.wishList.any((element) =>
                                    element.productId.toString() ==
                                    offers.productId)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: obj.wishList.any((element) =>
                                    element.productId.toString() ==
                                    offers.productId)
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
              margin: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    offers.productName,
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.01),
                  offers.discountType == "FLAT"
                      ? RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'RS ${offers.discountedPrice}  ',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15.0),
                              ),
                              TextSpan(
                                text: 'RS ${offers.price} ',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13.0,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        )
                      : RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: ' RS ${offers.discountedPrice}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16.0),
                              ),
                              TextSpan(
                                text: ' ${offers.discount}% OFF',
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 13.0),
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
        PassDataToProduct product = PassDataToProduct(
            offers.productName,
            offers.productId,
            offers.imagePaths,
            offers.discountedPrice.toString(),
            offers.price.toString(),
            offers.description.toString(),
            offers.discountType == "FLAT"
                ? "OFF ${offers.discount}"
                : "OFF ${offers.discount} %");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductPage(
                    bg: bg,
                    productData: product,
                    coupon: offers.couponid ?? 0,
                  )),
        );
      },
    );

    // InkWell(
    //   child: Container(
    //     margin: const EdgeInsets.all(5.0),
    //     padding: const EdgeInsets.all(5.0),
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
    //         Expanded(
    //           child: Container(
    //             height: double.infinity,
    //             margin: const EdgeInsets.all(6.0),
    //             child: offers.imagePaths.length == 0
    //                 ? Image(
    //                     image: AssetImage("assets/best_deal/best_deal_1.jpg"),
    //                     fit: BoxFit.fitHeight,
    //                   )
    //                 : Image.network(
    //                     GetImage(offers.imagePaths[0]),
    //                     fit: BoxFit.fitHeight,
    //                   ),
    //           ),
    //         ),
    //         Container(
    //           alignment: Alignment.center,
    //           margin: const EdgeInsets.only(right: 6.0, left: 6.0),
    //           child: Column(
    //             children: <Widget>[
    //               Text(
    //                 offers.productName,
    //                 style: const TextStyle(fontSize: 12.0),
    //                 overflow: TextOverflow.ellipsis,
    //                 maxLines: 1,
    //                 textAlign: TextAlign.center,
    //               ),
    //               Text(
    //                 offers.description,
    //                 style: const TextStyle(
    //                     color: Color(0xFF67A86B), fontSize: 15.0),
    //               ),
    //               Text(
    //                 offers.discount.toString() + " OFF",
    //                 style: const TextStyle(fontSize: 12.0),
    //                 overflow: TextOverflow.ellipsis,
    //                 maxLines: 2,
    //                 textAlign: TextAlign.center,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //   onTap: () {
    //     PassDataToProduct product = PassDataToProduct(
    //         offers.productName,
    //         offers.id.toString(),
    //         offers.imagePaths,
    //         offers.discountedPrice.toString(),
    //         offers.price.toString(),
    //         offers.description.toString(),
    //         offers.discountType == "FLAT"
    //             ? "OFF ${offers.discount}"
    //             : "OFF ${offers.discount} %");
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => ProductPage(
    //               productData: product, coupon: widget.couponid, bg: bg)),
    //     );
    //   },
    // );
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: List.generate(widget.offers!.length, (index) {
        Color bg = beautifulColors[index % beautifulColors.length];
        return getStructuredGridCell(widget.offers![index], bg, height, width);
      }),
    );
  }
}

class Offers {
  int offerId;
  String offerImage;
  String offerTitle;
  String offerText;
  String offerSubTitle;

  Offers(this.offerId, this.offerImage, this.offerTitle, this.offerText,
      this.offerSubTitle);
}

// Future<List<Offers>> loadOffers() async {
//   var jsonString = await rootBundle.loadString('assets/json/top_offers.json');
//   final jsonResponse = json.decode(jsonString);

//   List<Offers> offers = [];

//   for (var o in jsonResponse) {
//     Offers offer =
//         Offers(o["offerid"], o["image"], o["title"], o["offer"], o["subtitle"]);

//     offers.add(offer);
//   }

//   return offers;
// }

class PassData {
  final String title;
  final int offerid;

  PassData(this.title, this.offerid);
}
