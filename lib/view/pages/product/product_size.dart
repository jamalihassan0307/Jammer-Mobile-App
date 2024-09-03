// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ProductSize extends StatefulWidget {
  const ProductSize({super.key});

  @override
  _ProductSizeState createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  Color activeColor = Colors.blue;
  Color nonActiveColor = Colors.grey[100]!;
  bool xsSize = false, sSize = false, mSize = false, lSize = false;
  bool blackColor = false, redColor = false, blueColor = false;
  Color activeColorBorder = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Size',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Tip: For the best fit, buy one size larger than your usual size.',
            style: TextStyle(fontSize: 12.0),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                child: Container(
                  width: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (!xsSize) ? nonActiveColor : activeColor),
                    borderRadius: BorderRadius.circular(10.0),
                    color: (!xsSize) ? Colors.white : activeColor,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'XS',
                    style: TextStyle(
                        color: (!xsSize) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!xsSize) {
                      xsSize = true;
                      sSize = false;
                      mSize = false;
                      lSize = false;
                    } else {
                      xsSize = false;
                    }
                  });
                },
              ),
              InkWell(
                child: Container(
                  width: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (!sSize) ? nonActiveColor : activeColor),
                    borderRadius: BorderRadius.circular(10.0),
                    color: (!sSize) ? Colors.white : activeColor,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'S',
                    style: TextStyle(
                        color: (!sSize) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!sSize) {
                      sSize = true;
                      xsSize = false;
                      mSize = false;
                      lSize = false;
                    } else {
                      sSize = false;
                    }
                  });
                },
              ),
              InkWell(
                child: Container(
                  width: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (!mSize) ? nonActiveColor : activeColor),
                    borderRadius: BorderRadius.circular(10.0),
                    color: (!mSize) ? Colors.white : activeColor,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'M',
                    style: TextStyle(
                        color: (!mSize) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!mSize) {
                      mSize = true;
                      xsSize = false;
                      sSize = false;
                      lSize = false;
                    } else {
                      mSize = false;
                    }
                  });
                },
              ),
              InkWell(
                child: Container(
                  width: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (!lSize) ? nonActiveColor : activeColor),
                    borderRadius: BorderRadius.circular(10.0),
                    color: (!lSize) ? Colors.white : activeColor,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'L',
                    style: TextStyle(
                        color: (!lSize) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!lSize) {
                      lSize = true;
                      xsSize = false;
                      sSize = false;
                      mSize = false;
                    } else {
                      lSize = false;
                    }
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Divider(height: 1.0),
          const SizedBox(
            height: 8.0,
          ),
          const Text(
            'Color',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (!blackColor)
                              ? Colors.transparent
                              : activeColorBorder,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.black,
                    ),
                    child: (!blackColor)
                        ? Container()
                        : const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                  ),
                  onTap: () {
                    setState(() {
                      if (!blackColor) {
                        blackColor = true;
                        redColor = false;
                        blueColor = false;
                      } else {
                        blackColor = false;
                      }
                    });
                  },
                ),
                InkWell(
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (!redColor)
                              ? Colors.transparent
                              : activeColorBorder,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.red,
                    ),
                    child: (!redColor)
                        ? Container()
                        : const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                  ),
                  onTap: () {
                    setState(() {
                      if (!redColor) {
                        redColor = true;
                        blackColor = false;
                        blueColor = false;
                      } else {
                        redColor = false;
                      }
                    });
                  },
                ),
                InkWell(
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (!blueColor)
                              ? Colors.transparent
                              : activeColorBorder,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.blue,
                    ),
                    child: (!blueColor)
                        ? Container()
                        : const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                  ),
                  onTap: () {
                    setState(() {
                      if (!blueColor) {
                        blueColor = true;
                        redColor = false;
                        blackColor = false;
                      } else {
                        blueColor = false;
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
