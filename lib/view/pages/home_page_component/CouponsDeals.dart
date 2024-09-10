// ignore_for_file: must_be_immutable

// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/controllers/home_controller.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
import 'package:jammer_mobile_app/functions/passDataToProduct.dart';
import 'package:jammer_mobile_app/models/GetCouponsWithProducts%20.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/category/top_offers.dart';
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
                  // height: height * 0.6,
                  child: Column(
                    children: [
                      TopImage(
                        couponid: model.coupon.id,
                        id: model.coupon.id.toString(),
                        image: getSequentialImage(index),
                        title: model.coupon.code.toString(),
                      ),
                      OfferGrid(
                        coupon: model,
                        index: index,
                      ),
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
  TopImage(
      {super.key,
      required this.image,
      required this.title,
      required this.id,
      required this.couponid});
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
          left: 20.0,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0.0),
            width: 320.0,
            height: 50.0,
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
          height: 479.0,
          child: Stack(
            children: <Widget>[
              Container(
                width: width,
                height: 460.0,
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
                    itemCount: coupon.products.length,
                    primary: false,
                    itemBuilder: (BuildContext context, int index) {
                      Products data = coupon.products[index];
                      return InkWell(
                        child: Container(
                          margin: const EdgeInsets.all(5.0),
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
                              Container(
                                margin: const EdgeInsets.all(6.0),
                                height: 150.0,
                                child: data.imagePaths.length == 0
                                    ? Image(
                                        image:
                                            AssetImage("assets/download5.jpg"),
                                        fit: BoxFit.fitHeight,
                                      )
                                    : Image.network(
                                        StaticVariables.baseurl +
                                            data.imagePaths[0],
                                        fit: BoxFit.fitHeight,
                                      ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      data.productName,
                                      style: const TextStyle(fontSize: 12.0),
                                    ),
                                    SizedBox(
                                      height: height * 0.06,
                                      // color: Colors.pink,
                                      child: Text(
                                        data.description,
                                        style: TextStyle(

                                            // overflow: TextOverflow.fade,
                                            color: Color(0xFF67A86B),
                                            fontSize: 15.0),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
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
                                    )),
                          );
                        },
                      );
                    },
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
