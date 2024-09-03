// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/product/rating_row.dart';
import 'package:jammer_mobile_app/view/pages/product/product_size.dart';
import 'package:jammer_mobile_app/view/pages/product/get_similar_products.dart';
import 'package:jammer_mobile_app/widget/carousel_pro/lib/carousel_pro.dart';

class ProductDetails extends StatefulWidget {
  final data;

  const ProductDetails({Key? key, this.data}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool favourite = false;
  Color color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        // Slider and Add to Wishlist Code Starts Here
        Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0),
              color: Colors.white,
              child: Hero(
                tag: '${widget.data.title}',
                child: SizedBox(
                  height: (height / 2.0),
                  child: Carousel(
                    images: [
                      AssetImage(widget.data.imagePath),
                      AssetImage(widget.data.imagePath),
                      AssetImage(widget.data.imagePath),
                      AssetImage(widget.data.imagePath),
                      AssetImage(widget.data.imagePath)
                    ],
                    dotSize: 5.0,
                    dotSpacing: 15.0,
                    dotColor: Colors.grey,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.purple.withOpacity(0.0),
                    boxFit: BoxFit.fitHeight,
                    animationCurve: Curves.decelerate,
                    dotIncreasedColor: Colors.blue,
                    overlayShadow: true,
                    overlayShadowColors: Colors.white,
                    overlayShadowSize: 0.7,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              right: 20.0,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                elevation: 3.0,
                onPressed: () {
                  setState(() {
                    if (!favourite) {
                      favourite = true;
                      color = Colors.red;

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Added to Wishlist")));
                    } else {
                      favourite = false;
                      color = Colors.grey;
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Remove from Wishlist")));
                    }
                  });
                },
                child: Icon(
                  (!favourite)
                      ? FontAwesomeIcons.heart
                      : FontAwesomeIcons.solidHeart,
                  color: color,
                ),
              ),
            ),
          ],
        ),
        // Slider and Add to Wishlist Code Ends Here
        Container(
            color: Colors.white,
            child: const SizedBox(
              height: 8.0,
            )),
        const Divider(
          height: 1.0,
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
                      '₹${widget.data.price}',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '₹${widget.data.oldPrice}',
                      style: const TextStyle(
                          fontSize: 14.0,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '₹${widget.data.offer}',
                      style: TextStyle(fontSize: 14.0, color: Colors.red[700]),
                    ),
                  ],
                ),
              ),
              // Price & Offer Row Ends Here

              // Rating Row Starts Here
              const RatingRow(),
              // Rating Row Ends Here
            ],
          ),
        ),

        // Product Size & Color Start Here
        const ProductSize(),
        // Product Size & Color End Here

        // Product Details Start Here
        Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Product Details',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Color',
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Length',
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Type',
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Sleeve',
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Yellow',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Knee Length',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Bandage',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Cap Sleeve',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Product Details Ends Here

        // Product Description Start Here
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(top: 5.0),
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
              const Text(
                'Slip into this trendy and attractive dress from Rudraaksha and look stylish effortlessly. Made to accentuate any body type, it will give you that extra oomph and make you stand out wherever you are. Keep the accessories minimal for that added elegant look, just your favourite heels and dangling earrings, and of course, don\'t forget your pretty smile!',
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
                  _productDescriptionModalBottomSheet(context);
                },
              ),
              const Divider(
                height: 1.0,
              ),
            ],
          ),
        ),
        // Product Description Ends Here

        // Similar Product Starts Here
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          color: Colors.white,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Similar Products',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.0,
              ),
              GetSimilarProducts(),
            ],
          ),
        ),
        // Similar Product Ends Here
      ],
    );
  }

  // Bottom Sheet for Product Description Starts Here
  void _productDescriptionModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(8.0),
                child: const Column(
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
                      'Slip into this trendy and attractive dress from Rudraaksha and look stylish effortlessly. Made to accentuate any body type, it will give you that extra oomph and make you stand out wherever you are. Keep the accessories minimal for that added elegant look, just your favourite heels and dangling earrings, and of course, don\'t forget your pretty smile!',
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
