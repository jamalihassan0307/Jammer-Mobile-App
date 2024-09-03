import 'package:flutter/material.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/category/top_offers.dart';

class BestOfferGrid extends StatelessWidget {
  final bestOffers = [
    {
      'title': 'Mobile under ₹7000',
      'image': 'assets/best_offer/best_offer_1.jpg'
    },
    {
      'title': 'Best Deals on Laptop',
      'image': 'assets/best_offer/best_offer_2.jpg'
    },
    {
      'title': 'Most Affordable Mobile',
      'image': 'assets/best_offer/best_offer_3.jpg'
    }
  ];

  BestOfferGrid({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    InkWell getStructuredGridCell(bestOffer) {
      final item = bestOffer;
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
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 3,
        children: List.generate(bestOffers.length, (index) {
          return getStructuredGridCell(bestOffers[index]);
        }),
      ),
    );
  }
}
