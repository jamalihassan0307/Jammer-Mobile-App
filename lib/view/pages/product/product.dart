// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:jammer_mobile_app/view_model/controllers/cart/cart_controller.dart';
import 'package:jammer_mobile_app/models/cart/CartModel.dart';
import 'package:jammer_mobile_app/view/pages/cart/cart.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/product/product_details.dart';
import 'package:jammer_mobile_app/view/pages/order_payment/delivery_address.dart';
import 'package:jammer_mobile_app/res/components/functions/passDataToProduct.dart';
import 'package:jammer_mobile_app/view/pages/wishlist/wishlist.dart';
import 'package:page_transition/page_transition.dart';

class ProductPage extends StatefulWidget {
  final PassDataToProduct productData;

  final int coupon;

  final Color bg;

  const ProductPage(
      {Key? key,
      required this.productData,
      required this.coupon,
      required this.bg});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool favourite = false;
  int cartItem = 3;

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return GetBuilder<CartController>(builder: (obj) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.productData.title,
            style: TextStyle(color: Colors.black),
          ),
          titleSpacing: 0.0,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          // automaticallyImplyLeading: false,
          // primary: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const WishlistPage()));
              },
            ),
            IconButton(
              icon: badges.Badge(
                badgeContent: Text(
                  '${obj.numberofcart.toString()}',
                  style: TextStyle(color: Colors.white),
                ),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.red.shade300,
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const CartPage()));
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          height: height,
          width: width,
          child: ProductDetails(
              data: widget.productData, coupon: widget.coupon, bg: widget.bg),
        ),
        bottomNavigationBar: Material(
          elevation: 5.0,
          child: Container(
            color: Colors.white,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    obj.Addcart(widget.productData, widget.coupon);
                  },
                  child: Container(
                    width: width / 2,
                    height: 50.0,
                    color: Color(0xFFFFD700),
                    alignment: Alignment.center,
                    child: const Text(
                      'Add To Cart',
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    CartModel productData = CartModel(
                        id: widget.productData.productId,
                        productId: widget.productData.productId,
                        productName: widget.productData.title,
                        price: widget.productData.price,
                        quantity: 1,
                        couponId: 0,
                        createdAt: widget.productData.title);
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Delivery(
                              type: 0,
                              productData: [productData],
                            )));
                  },
                  child: Container(
                    width: width / 2,
                    height: 50.0,
                    color: Theme.of(context).primaryColor,
                    alignment: Alignment.center,
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
