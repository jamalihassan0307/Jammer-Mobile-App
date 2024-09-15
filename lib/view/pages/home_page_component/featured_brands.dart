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

class FeaturedBrandSlider extends StatelessWidget {
  FeaturedBrandSlider({super.key});

  final List<List<Color>> gradientColors = [
    [Color(0xFF2874F0), Color(0xFF6EC5E9)],
    [Color(0xFF34A853), Color(0xFF2874F0)],
    [Color(0xFFFED700), Color(0xFF2874F0)],
    [Color(0xFF2874F0), Color(0xFFDA4453)],
    [Color(0xFF42A5F5), Color(0xFF1E88E5)],
    [Color(0xFF8E44AD), Color(0xFF2874F0)],
    [Color(0xFFF57C00), Color(0xFF2874F0)],
    [Color(0xFF2874F0), Color(0xFF2ECC71)],
  ];
  @override
  Widget build(BuildContext context) {
    InkWell getStructuredGridCell(GetCategoryModel featuredBrand, int index) {
      final item = featuredBrand;
      // Use gradient color based on the index
      final colors = gradientColors[index % gradientColors.length];

      return InkWell(
        onTap: () {
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
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Image.network(
                  GetImage(item.image!),
                  height: 150,
                  width: 200,
                ),
              ),
              Positioned(
                bottom: 8.0,
                child: Text(
                  item.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
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
                'Featured Brands',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                enlargeCenterPage: true,
                autoPlay: true,
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
