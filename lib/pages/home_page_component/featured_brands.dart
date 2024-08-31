import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// My Own Imports
import 'package:jammer_mobile_app/pages/category/top_offers.dart';

class FeaturedBrandSlider extends StatelessWidget {
  final featuredBrandList = [
    {
      'title': 'Samsung',
      'image': 'assets/featured_brands/featured_brand_1.jpg'
    },
    {
      'title': 'Philips',
      'image': 'assets/featured_brands/featured_brand_2.jpg'
    },
    {'title': 'Intel', 'image': 'assets/featured_brands/featured_brand_3.jpg'}
  ];

  FeaturedBrandSlider({super.key});

  @override
  Widget build(BuildContext context) {
    InkWell getStructuredGridCell(featuredBrand) {
      final item = featuredBrand;
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TopOffers(title: '${item['title']}')),
          );
        },
        child: Image(
          image: AssetImage(item['image']),
        ),
      );
    }

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
            items: List.generate(featuredBrandList.length, (index) {
              return getStructuredGridCell(featuredBrandList[index]);
            }),
          ),
        ],
      ),
    );
  }
}
