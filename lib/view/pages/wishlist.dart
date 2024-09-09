// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jammer_mobile_app/controllers/wishlist_controller.dart';
import 'package:jammer_mobile_app/models/CartModel.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/home.dart';
import 'package:jammer_mobile_app/widget/loading.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<WishListController>(builder: (obj) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('My Wishlist'),
          titleSpacing: 0.0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: (obj.numberofWishList == 0)
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      FontAwesomeIcons.heartCrack,
                      color: Colors.grey,
                      size: 60.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'No Item in Wishlist',
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
                itemCount: obj.wishList.length,
                itemBuilder: (context, index) {
                  CartModel item = obj.wishList[index];
                  return Slidable(
                    key: ValueKey(index),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      extentRatio: 0.16,
                      children: [
                        GestureDetector(
                          onTap: () {
                            obj.removeWishList(index, item.id);

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
                            children: [
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
                                width: (width * 0.5),
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
                                            obj.removeWishList(index, item.id);

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
