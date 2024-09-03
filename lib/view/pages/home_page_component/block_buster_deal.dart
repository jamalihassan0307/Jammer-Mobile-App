import 'package:flutter/material.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/category/top_offers.dart';

class BlockBusterDeals extends StatelessWidget {
  const BlockBusterDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: 500.0,
      child: Column(
        children: <Widget>[
          const TopImage(),
          OfferGrid(),
        ],
      ),
    );
  }
}

class TopImage extends StatelessWidget {
  const TopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Image(
          image: AssetImage('assets/top_design/block_buster_deals.jpg'),
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
                const Text(
                  'Limited Hours..',
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
                          builder: (context) =>
                              const TopOffers(title: 'Block Buster Deals')),
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
  OfferGrid({super.key});
  final blockBustorDealList = [
    {
      'image': 'assets/block_bustor_deal/block_bustor_1.jpg',
      'title': 'Oppo A3s',
      'offer': 'Flat ₹6,000 Off'
    },
    {
      'image': 'assets/block_bustor_deal/block_bustor_2.jpg',
      'title': 'Blockbustor Deals On TVs',
      'offer': 'From ₹5,499'
    },
    {
      'image': 'assets/block_bustor_deal/block_bustor_3.jpg',
      'title': 'Asian, Kraasa & more',
      'offer': 'Min. 55% Off'
    },
    {
      'image': 'assets/block_bustor_deal/block_bustor_4.jpg',
      'title': 'Puma, FILA & more',
      'offer': 'Min. 60% Off'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    InkWell getStructuredGridCell(blockBustorDeal) {
      final item = blockBustorDeal;
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
                child: Image(
                  image: AssetImage(item['image']),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text(
                      '${item['title']}',
                      style: const TextStyle(fontSize: 12.0),
                    ),
                    Text(
                      '${item['offer']}',
                      style: const TextStyle(
                          color: Color(0xFF67A86B), fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                decoration: const BoxDecoration(
                  color: Color(0xFFF83850),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
                width: width - 20.0,
                margin:
                    const EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
                child: GridView.count(
                  primary: false,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  crossAxisCount: 2,
                  childAspectRatio: ((width) / 500),
                  children: List.generate(blockBustorDealList.length, (index) {
                    return getStructuredGridCell(blockBustorDealList[index]);
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
