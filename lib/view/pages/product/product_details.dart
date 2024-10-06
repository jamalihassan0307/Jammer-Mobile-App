// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/view_model/controllers/cart/cart_controller.dart';
import 'package:jammer_mobile_app/view_model/controllers/wishlist/wishlist_controller.dart';
import 'package:jammer_mobile_app/res/components/functions/passDataToProduct.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/product/rating_row.dart';
// import 'package:jammer_mobile_app/view/pages/product/get_similar_products.dart';
import 'package:jammer_mobile_app/utils/carousel_pro/lib/carousel_pro.dart';
import 'package:jammer_mobile_app/repository/loading.dart';

class ProductDetails extends StatefulWidget {
  final PassDataToProduct data;
  final int coupon;
  final Color bg;

  const ProductDetails(
      {Key? key, required this.data, required this.coupon, required this.bg})
      : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  initState() {
    Get.put(CartController());

    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      getdata();
    });
  }

  getdata() {
    WishListController.to.updatecolor(widget.data.productId);
    CartController.to.getreview(widget.data.productId.toString());
    CartController.to.updatequatity(0);
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                // color: Colors.white,
                height: height * 0.51,
                child: Stack(
                  children: [
                    Positioned(
                      left: -100,
                      right: -100,
                      top: -105,
                      child: Align(
                        alignment: Alignment.center,
                        child: Card(
                          elevation: 2,
                          child: CircleAvatar(
                            radius: 280,
                            backgroundColor: Colors.white,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(290),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 170,
                        backgroundColor: widget.bg,
                        child: Hero(
                          tag: '${widget.data.title}',
                          child: SizedBox(
                            height: (height * 0.25),
                            child: Carousel(
                              images: [
                                ...widget.data.imagePath.map(
                                  (item) => NetworkImage(GetImage(item)),
                                ),
                              ],
                              dotSize: 5.0,
                              dotSpacing: 15.0,
                              dotColor: Colors.grey,
                              indicatorBgPadding: 0.0,
                              dotBgColor: Colors.purple.withOpacity(0.0),
                              boxFit: BoxFit.fitHeight,
                              animationCurve: Curves.easeInQuad,
                              dotIncreasedColor: Colors.blue,
                              overlayShadow: true,
                              overlayShadowColors: widget.bg,
                              overlayShadowSize: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GetBuilder<WishListController>(builder: (obj) {
              return Positioned(
                // top: 10.0,
                right: 20.0,
                child: FloatingActionButton(
                  backgroundColor: widget.bg.withOpacity(0.7),
                  // elevation: 3.0,
                  onPressed: () {
                    if (!obj.wishList.any((element) =>
                        element.productId == widget.data.productId)) {
                      obj.color = Colors.red;
                      obj.AddWishList(widget.data, widget.coupon);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Added to Wishlist")));
                    } else {
                      obj.color = Colors.grey;
                      obj.removeWishList(obj.wishList
                          .where((element) =>
                              element.productId == widget.data.productId)
                          .firstOrNull!
                          .id);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Remove from Wishlist")));
                    }
                  },
                  child: Icon(
                    (!obj.wishList.any((element) =>
                            element.productId == widget.data.productId))
                        ? FontAwesomeIcons.heart
                        : FontAwesomeIcons.solidHeart,
                    color: obj.color,
                  ),
                ),
              );
            }),
          ],
        ),
        // Slider and Add to Wishlist Code Ends Here
        Container(
            color: Colors.white,
            child: const SizedBox(
              height: 8.0,
            )),
        Center(
          child: GetBuilder<CartController>(builder: (obj) {
            return Container(
                height: height * 0.05,
                width: width * 0.4,
                // color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Center(
                          child: Text(
                        " ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.145,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(30))),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            obj.updatequatity(obj.quatity - 1);
                          },
                          child: Text(
                            "-",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.145,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(30))),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            obj.updatequatity(obj.quatity + 1);
                          },
                          child: Text(
                            "+",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                          child: Text(
                        obj.quatity.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ],
                ));
          }),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Product Title Start Here
              Text(
                '${widget.data.title}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              // Product Title End Here

              // Special Price badge Start Here
              Container(
                margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  'Special Price',
                  style: TextStyle(color: Colors.red[800], fontSize: 12.0),
                ),
              ),
              // Special Price badge Ends Here.

              // Price & Offer Row Starts Here
              Container(
                margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'RS ${widget.data.price}',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'RS ${widget.data.oldPrice}',
                      style: const TextStyle(
                          fontSize: 14.0,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'RS ${widget.data.offer}',
                      style: TextStyle(fontSize: 14.0, color: Colors.red[700]),
                    ),
                  ],
                ),
              ),
              // Price & Offer Row Ends Here

              // Rating Row Starts Here
              RatingRow(id: widget.data.productId.toString()),
              // Rating Row Ends Here
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.all(10.0),
          // margin: const EdgeInsets.only(top: 5.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Product Description',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                "${widget.data.dis}",
                style: TextStyle(fontSize: 14.0, height: 1.45),
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 5.0),
              const Divider(
                height: 1.0,
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'View More',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _productDescriptionModalBottomSheet(context, widget.data.dis);
                },
              ),
              SizedBox(height: height * 0.05),
              // const Divider(
              //   height: 1.0,
              // ),
            ],
          ),
        ),
      ],
    );
  }

  // Bottom Sheet for Product Description Starts Here
  void _productDescriptionModalBottomSheet(context, String dis) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Product Description',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Divider(
                      height: 1.0,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "${dis.toString()}",
                      style: TextStyle(fontSize: 14.0, height: 1.45),
                      // overflow: TextOverflow.ellipsis,
                      // maxLines: 5,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
  // Bottom Sheet for Product Description Ends Here
}

class BottomCircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.5);

    path.quadraticBezierTo(
        size.width * 0.5, size.height, size.width, size.height * 0.5);
    // path.quadraticBezierTo(size.width * 0.5, 0, 0, size.height * 0.5);

    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
