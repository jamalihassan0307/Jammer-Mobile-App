// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:jammer_mobile_app/controllers/cart_controller.dart';
import 'package:jammer_mobile_app/models/CartModel.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/product/product_details.dart';
import 'package:jammer_mobile_app/view/pages/order_payment/delivery_address.dart';
import 'package:jammer_mobile_app/view/pages/cart.dart';
import 'package:jammer_mobile_app/view/pages/wishlist.dart';
import 'package:jammer_mobile_app/functions/passDataToProduct.dart';
import 'package:page_transition/page_transition.dart';

class ProductPage extends StatefulWidget {
  final PassDataToProduct productData;

  final int coupon;

  const ProductPage(
      {Key? key, required this.productData, required this.coupon});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool favourite = false;
  int cartItem = 3;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<CartController>(builder: (obj) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.productData.title),
          titleSpacing: 0.0,
          backgroundColor: Theme.of(context).primaryColor,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
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
                badgeContent: Text('${obj.numberofcart.toString()}'),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Theme.of(context).primaryColorLight,
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
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
        backgroundColor: const Color(0xFFF1F3F6),
        body: ProductDetails(data: widget.productData, coupon: widget.coupon),
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
                    color: Theme.of(context).primaryColorLight,
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
