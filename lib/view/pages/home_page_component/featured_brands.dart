// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/controllers/home_controller.dart';
import 'package:jammer_mobile_app/models/get_category_model.dart';
import 'package:jammer_mobile_app/view/pages/category/top_offers.dart';

// My Own Imports
// import 'package:jammer_mobile_app/view/pages/category/top_offers.dart';
// import 'package:jammer_mobile_app/view/pages/home.dart';
import 'package:jammer_mobile_app/widget/loading.dart';

class TopCouponProducts extends StatelessWidget {
  TopCouponProducts({super.key});

  final List<String> gradientColors = [
    "assets/bg1.jpg",
    "assets/bg2.jpg",
    "assets/bg3.jpg",
    "assets/bg4.jpg",
    "assets/bg5.jpg",
    "assets/bg6.jpg",
  ];
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    InkWell getStructuredGridCell(GetCategoryModel featuredBrand, int index) {
      final item = featuredBrand;
      // Use gradient color based on the index
      String colors = gradientColors[index % gradientColors.length];

      return InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => TopOffers(
          //             couponid: item.id,
          //             title: '${item.name}',
          //             id: item.id.toString(),
          //           )),
          // );
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(colors), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.network(
                    GetImage(item.image!),
                    height: height * 0.23,
                    width: 200,
                  ),
                ),
              ),
              Positioned(
                left: 8.0,
                child: Container(
                  // color: Colors.pink,
                  width: width * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Text(
                        item.name.substring(0, 1).toUpperCase() +
                            item.name.substring(1),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Home  Products",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TopOffers(
                                      couponid: item.id,
                                      title: '${item.name}',
                                      id: item.id.toString(),
                                    )),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          side: BorderSide(color: Colors.transparent, width: 0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          shape: const RoundedRectangleBorder(),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.black, width: 1),
                            ),
                          ),
                          child: Text(
                            "Order Now",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GetBuilder<HomeController>(builder: (obj) {
      return Container(
        height: 305.0,
        padding: const EdgeInsets.only(bottom: 0.0),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(12.0),
              alignment: Alignment.topLeft,
              child: const Text(
                'New Product Category',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                enlargeCenterPage: true,
                // autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: List.generate(obj.category.length, (index) {
                return getStructuredGridCell(obj.category[index], index);
              }),
            ),
          ],
        ),
      );
    });
  }
}
