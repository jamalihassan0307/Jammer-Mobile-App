// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/home.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  int wishlistItem = 4;

  final wishlistItemList = [
    {
      'title': 'Orange One Piece for Women',
      'image': 'assets/products/wedding_collection/wedding_collection_11.jpg',
      'price': 649,
      'size': 'L'
    },
    {
      'title': 'White One Piece for Women',
      'image': 'assets/products/wedding_collection/wedding_collection_10.jpg',
      'price': 299,
      'size': 'M'
    },
    {
      'title': 'Julee Crepe Embroidered Salwar Suit Material',
      'image': 'assets/products/wedding_collection/wedding_collection_8.jpg',
      'price': 849,
      'size': 'L'
    },
    {
      'title': 'Saara Poly Silk Embellished, Woven Salwar Suit Material',
      'image': 'assets/products/wedding_collection/wedding_collection_2.jpg',
      'price': 549,
      'size': 'XS'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlist'),
        titleSpacing: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: (wishlistItem == 0)
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
              itemCount: wishlistItemList.length,
              itemBuilder: (context, index) {
                final item = wishlistItemList[index];
                return Slidable(
                  key: ValueKey(index),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    extentRatio: 0.16,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            wishlistItemList.removeAt(index);
                            wishlistItem = wishlistItem - 1;
                          });

                          // Then show a snackbar.
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Item Removed'),
                          ));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 5.0,
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
                  child: Container(
                    height: 180.0,
                    padding: const EdgeInsets.all(5.0),
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
                                SizedBox(
                                  width: 120.0,
                                  height: 160.0,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            setState(() {
                                              wishlistItemList.removeAt(index);
                                              wishlistItem--;
                                            });

                                            // Then show a snackbar.
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
                              ),
                            )
                          ],
                        )),
                  ),
                );
              },
            ),
    );
  }
}
