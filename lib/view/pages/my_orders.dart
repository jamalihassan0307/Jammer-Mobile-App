// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final cartItemList = [
    {
      'status': 1,
      'title': 'Orange One Piece for Women',
      'image': 'assets/products/wedding_collection/wedding_collection_11.jpg',
      'price': 649,
      'size': 'L'
    },
    {
      'status': 2,
      'title': 'White One Piece for Women',
      'image': 'assets/products/wedding_collection/wedding_collection_10.jpg',
      'price': 299,
      'size': 'M'
    },
    {
      'status': 3,
      'title': 'Julee Crepe Embroidered Salwar Suit Material',
      'image': 'assets/products/wedding_collection/wedding_collection_8.jpg',
      'price': 849,
      'size': 'L'
    }
  ];

  @override
  Widget build(BuildContext context) {
    Container checkStatus(status) {
      // status 1 => Out for Delivery
      // status 2 => Shipped
      // status 3 => Delivered

      if (status == 1) {
        return Container(
          padding: const EdgeInsets.all(5.0),
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(topRight: Radius.circular(5.0)),
          ),
          child: const Text(
            'Out for Delivery',
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        );
      } else if (status == 2) {
        return Container(
          padding: const EdgeInsets.all(5.0),
          decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(topRight: Radius.circular(5.0)),
          ),
          child: const Text(
            'Shipped',
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        );
      } else {
        return Container(
          padding: const EdgeInsets.all(5.0),
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(topRight: Radius.circular(5.0)),
          ),
          child: const Text(
            'Delivered',
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        titleSpacing: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: cartItemList.length,
        itemBuilder: (context, index) {
          final item = cartItemList[index];
          return SizedBox(
            height: 180.0,
            child: Card(
                elevation: 5.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      right: 0,
                      child: checkStatus(item['status']),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 120.0,
                                    height: 160.0,
                                    alignment: Alignment.center,
                                    child: Image(
                                      image: AssetImage('${item['image']}'),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '${item['title']}',
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          const Text(
                                            'Price:',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            '₹${item['price']}',
                                            style: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 7.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          RichText(
                                            text: TextSpan(
                                              text: 'Size:  ',
                                              style: const TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.grey),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: '  ${item['size']}',
                                                    style: const TextStyle(
                                                        fontSize: 15.0,
                                                        color: Colors.blue)),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
