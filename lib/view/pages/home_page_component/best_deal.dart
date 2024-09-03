import 'package:flutter/material.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/category/top_offers.dart';

class BestDealGrid extends StatelessWidget {
  final bestDealList = [
    {
      'title': 'Latest Winter Collection',
      'image': 'assets/best_deal/best_deal_1.jpg'
    },
    {
      'title': 'Bedsheets, Curtains & More',
      'image': 'assets/best_deal/best_deal_2.jpg'
    }
  ];

  BestDealGrid({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    InkWell getStructuredGridCell(bestDeal) {
      final item = bestDeal;
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
      padding: const EdgeInsets.all(0.0),
      alignment: Alignment.center,
      width: width - 20.0,
      child: GridView.count(
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(0),
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
        crossAxisCount: 2,
        childAspectRatio: ((width) / 500),
        children: List.generate(bestDealList.length, (index) {
          return getStructuredGridCell(bestDealList[index]);
        }),
      ),
    );
  }
}
