import 'package:flutter/material.dart';

// My Own Imports
import 'package:jammer_mobile_app/pages/category/top_offers.dart';

class CategoryGrid extends StatelessWidget {
  final categoryList = [
    {'title': 'Top Offers', 'image': 'assets/category/top_offers.jpg'},
    {
      'title': 'Mobiles & Tablets',
      'image': 'assets/category/mobile_tablet.jpg'
    },
    {'title': 'Fashion', 'image': 'assets/category/fashion.jpg'},
    {
      'title': 'Electronics & Accessories',
      'image': 'assets/category/electronics.jpg'
    },
    {
      'title': 'Home & Furniture',
      'image': 'assets/category/home_forniture.jpg'
    },
    {'title': 'TV & Appliances', 'image': 'assets/category/tv_appliances.jpg'},
    {'title': 'Beauty & Personal Care', 'image': 'assets/category/beauty.jpg'},
    {
      'title': 'Monthly Essentials',
      'image': 'assets/category/monthly_essentials.jpg'
    }
  ];

  CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    InkWell getStructuredGridCell(category) {
      final item = category;
      return InkWell(
        child: Image(
          image: AssetImage(item['image']),
          fit: BoxFit.fitHeight,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TopOffers(title: '${item['title']}')),
          );
        },
      );
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(5.0),
      alignment: Alignment.center,
      width: width - 20.0,
      child: GridView.count(
        primary: false,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        crossAxisSpacing: 0,
        mainAxisSpacing: 15,
        crossAxisCount: 4,
        childAspectRatio: ((width) / 500),
        children: List.generate(categoryList.length, (index) {
          return getStructuredGridCell(categoryList[index]);
        }),
      ),
    );
  }
}
