// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'dart:async' show Future, Timer;
// import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/controllers/TopOffers_controller.dart';
import 'package:jammer_mobile_app/controllers/home_controller.dart';
import 'package:jammer_mobile_app/functions/passDataToProduct.dart';
import 'package:jammer_mobile_app/models/ProductsByCategory%20.dart';
import 'package:jammer_mobile_app/models/RandamProduct.dart';
import 'package:jammer_mobile_app/view/pages/product/product.dart';

// My Own Imports
import 'package:jammer_mobile_app/widget/loading.dart';

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
                          'Deals of the Day(${obj.couponproductlist.length} Results)',
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
                              offers:
                                  HomeController.to.randomCouponProductslist,
                              couponid: widget.couponid!),
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
  InkWell getStructuredGridCell(ProductsByCategory offers) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
              color: Colors.grey,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: double.infinity,
                margin: const EdgeInsets.all(6.0),
                child: offers.imagePath.length == 0
                    ? Image(
                        image: AssetImage("assets/best_deal/best_deal_1.jpg"),
                        fit: BoxFit.fitHeight,
                      )
                    : Image.network(
                        GetImage(offers.imagePath[0]),
                        fit: BoxFit.fitHeight,
                      ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 6.0, left: 6.0),
              child: Column(
                children: <Widget>[
                  Text(
                    offers.name,
                    style: const TextStyle(fontSize: 12.0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    offers.description,
                    style: const TextStyle(
                        color: Color(0xFF67A86B), fontSize: 15.0),
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
                    productData: product,
                    coupon: widget.couponid,
                  )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 2,
      childAspectRatio: ((width) / 490),
      children: List.generate(widget.offers!.length, (index) {
        return getStructuredGridCell(widget.offers![index]);
      }),
    );
  }
}

class TopOffersGridView extends StatefulWidget {
  final List<RandamProduct>? offers;
  final int couponid;

  const TopOffersGridView({Key? key, this.offers, required this.couponid})
      : super(key: key);

  @override
  _TopOffersGridViewState createState() => _TopOffersGridViewState();
}

class _TopOffersGridViewState extends State<TopOffersGridView> {
  InkWell getStructuredGridCell(RandamProduct offers) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
              color: Colors.grey,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: double.infinity,
                margin: const EdgeInsets.all(6.0),
                child: offers.imagePaths.length == 0
                    ? Image(
                        image: AssetImage("assets/best_deal/best_deal_1.jpg"),
                        fit: BoxFit.fitHeight,
                      )
                    : Image.network(
                        GetImage(offers.imagePaths[0]),
                        fit: BoxFit.fitHeight,
                      ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 6.0, left: 6.0),
              child: Column(
                children: <Widget>[
                  Text(
                    offers.productName,
                    style: const TextStyle(fontSize: 12.0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    offers.description,
                    style: const TextStyle(
                        color: Color(0xFF67A86B), fontSize: 15.0),
                  ),
                  Text(
                    offers.discount.toString() + " OFF",
                    style: const TextStyle(fontSize: 12.0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
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
                    productData: product,
                    coupon: widget.couponid,
                  )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 2,
      childAspectRatio: ((width) / 490),
      children: List.generate(widget.offers!.length, (index) {
        return getStructuredGridCell(widget.offers![index]);
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
