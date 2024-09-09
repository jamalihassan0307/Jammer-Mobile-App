// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:jammer_mobile_app/functions/passDataToProduct.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/order_payment/payment.dart';
import 'package:page_transition/page_transition.dart';

class Delivery extends StatefulWidget {
  final PassDataToProduct productData;

  final int coupon;

  const Delivery({Key? key, required this.productData, required this.coupon});

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery'),
        backgroundColor: Theme.of(context).primaryColor,
        titleSpacing: 0.0,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Where are your Ordered Item Shipped?',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Alatsi',
                      height: 1.6),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: width - 40.0,
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: 'Pin Code',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                SizedBox(
                  width: width - 40.0,
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: 'Locality',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                SizedBox(
                  width: width - 40.0,
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: 'City',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                SizedBox(
                  width: width - 40.0,
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: 'State',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: PaymentPage(
                                productData: widget.productData,
                                coupon: widget.coupon,
                              )));
                    },
                    child: Container(
                      width: width - 40.0,
                      padding: const EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: const Text(
                        'Go to Payment',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
