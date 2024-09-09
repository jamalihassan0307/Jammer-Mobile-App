// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/controllers/card_controller.dart';
import 'package:jammer_mobile_app/models/CartModel.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/home.dart';
import 'package:jammer_mobile_app/view/pages/order_payment/delivery_address.dart';
import 'package:jammer_mobile_app/widget/loading.dart';
import 'package:page_transition/page_transition.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.7;
    double widthFull = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    void showAlertDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Alert",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text("No Item in Cart"),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Close",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return GetBuilder<CartController>(builder: (obj) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
          titleSpacing: 0.0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        bottomNavigationBar: Material(
          elevation: 5.0,
          child: Container(
            color: Colors.white,
            width: widthFull,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: ((widthFull) / 2),
                  height: 50.0,
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: 'Total: ',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' ₹${obj.cartTotal}',
                            style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // (obj.cartTotal == 0)
                    //     ? showAlertDialog()
                    //     : Navigator.push(
                    //         context,
                    //         PageTransition(
                    //             type: PageTransitionType.rightToLeft,
                    //             child: const Delivery()));
                  },
                  child: Container(
                    width: ((widthFull) / 2),
                    height: 50.0,
                    color: (obj.cartTotal == 0)
                        ? Colors.grey
                        : Theme.of(context).primaryColor,
                    alignment: Alignment.center,
                    child: const Text(
                      'Pay Now',
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: (obj.cardlist.length == 0)
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      FontAwesomeIcons.basketShopping,
                      color: Colors.grey,
                      size: 60.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'No Item in Cart',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      child: const Text(
                        'Go To Home',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                    )
                  ],
                ),
              )
            : ListView.builder(
                itemCount: obj.cardlist.length,
                itemBuilder: (context, index) {
                  CartModel item = obj.cardlist[index];
                  return Slidable(
                    key: ValueKey(index),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      extentRatio: 0.16,
                      children: [
                        GestureDetector(
                          onTap: () {
                            obj.removecart(index, item.id);

                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Item Removed'),
                            ));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 3.0,
                            ),
                            width: MediaQuery.of(context).size.width * 0.16,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    child: SizedBox(
                      height: (height / 5.0),
                      child: Card(
                          elevation: 3.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      width: 120.0,
                                      height: double.infinity,
                                      alignment: Alignment.center,
                                      child: Image.network(
                                          GetImage(item.productImages![0])),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                width: (width - 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${item.productName}',
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
                                          '₹${item.price}',
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
                                        // RichText(
                                        //   text: TextSpan(
                                        //     text: 'Size:  ',
                                        //     style: const TextStyle(
                                        //         fontSize: 15.0,
                                        //         color: Colors.grey),
                                        //     children: <TextSpan>[
                                        //       TextSpan(
                                        //           text: '  size',
                                        //           style: const TextStyle(
                                        //               fontSize: 15.0,
                                        //               color: Colors.blue)),
                                        //     ],
                                        //   ),
                                        // ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        InkWell(
                                          child: Container(
                                            color: Colors.grey,
                                            padding: const EdgeInsets.all(3.0),
                                            child: const Text(
                                              'Remove',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          onTap: () {
                                            obj.removecart(index, item.id);

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content:
                                                        Text("Item Removed")));
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                  );
                },
              ),
      );
    });
  }
}
