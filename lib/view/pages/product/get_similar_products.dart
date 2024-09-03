// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:jammer_mobile_app/functions/passDataToProduct.dart';
import 'package:jammer_mobile_app/view/pages/product/product.dart';

class GetSimilarProducts extends StatefulWidget {
  const GetSimilarProducts({super.key});

  @override
  _GetSimilarProductsState createState() => _GetSimilarProductsState();
}

class _GetSimilarProductsState extends State<GetSimilarProducts> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return FutureBuilder<List<Products>>(
      future: loadProducts(),
      builder: (context, snapshot) {
        // ignore: avoid_print
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? SizedBox(
                height: (height / 2.5),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: InkWell(
                          child: Container(
                            width: (width / 2),
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5.0,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  // height: 185.0,
                                  height: ((height - 150.0) / 2.95),

                                  margin: const EdgeInsets.all(6.0),
                                  child: Image(
                                    image: AssetImage(
                                        snapshot.data![index].productImage),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                      right: 6.0, left: 6.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        snapshot.data![index].productTitle,
                                        style: const TextStyle(fontSize: 12.0),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "₹${snapshot.data![index].productPrice}",
                                            style:
                                                const TextStyle(fontSize: 16.0),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            width: 7.0,
                                          ),
                                          Text(
                                            "₹${snapshot.data![index].productOldPrice}",
                                            style: const TextStyle(
                                                fontSize: 13.0,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.grey),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        snapshot.data![index].offerText,
                                        style: const TextStyle(
                                            color: Color(0xFF67A86B),
                                            fontSize: 14.0),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                          productData: PassDataToProduct(
                                              snapshot
                                                  .data![index].productTitle,
                                              snapshot.data![index].productId,
                                              snapshot
                                                  .data![index].productImage,
                                              snapshot
                                                  .data![index].productPrice,
                                              snapshot
                                                  .data![index].productOldPrice,
                                              snapshot.data![index].offerText),
                                        )));
                          },
                        ),
                      );
                    }),
              )
            : Center(
                child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Color(0xFFF1F3F6)),
              ));
      },
    );
  }
}

class SimilarProductsGridView extends StatefulWidget {
  final List<Products>? products;

  const SimilarProductsGridView({Key? key, this.products}) : super(key: key);

  @override
  _SimilarProductsGridViewState createState() =>
      _SimilarProductsGridViewState();
}

class _SimilarProductsGridViewState extends State<SimilarProductsGridView> {
  Hero getStructuredGridCell(Products products) {
    double height = MediaQuery.of(context).size.height;
    return Hero(
      tag: products.productTitle,
      child: InkWell(
        child: Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5.0,
                color: Colors.grey,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Container(
                // height: 185.0,
                height: ((height - 150.0) / 2.95),
                margin: const EdgeInsets.all(6.0),
                child: Image(
                  image: AssetImage(products.productImage),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 6.0, left: 6.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      products.productTitle,
                      style: const TextStyle(fontSize: 12.0),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "₹${products.productPrice}",
                          style: const TextStyle(fontSize: 16.0),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          width: 7.0,
                        ),
                        Text(
                          "₹${products.productOldPrice}",
                          style: const TextStyle(
                              fontSize: 13.0,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Text(
                      products.offerText,
                      style: const TextStyle(
                          color: Color(0xFF67A86B), fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductPage(
                        productData: PassDataToProduct(
                            products.productTitle,
                            products.productId,
                            products.productImage,
                            products.productPrice,
                            products.productOldPrice,
                            products.offerText),
                      )));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 2,
      childAspectRatio: ((width) / (height - 150.0)),
      children: List.generate(widget.products!.length, (index) {
        return getStructuredGridCell(widget.products![index]);
      }),
    );
  }
}

class Products {
  int productId;
  String productImage;
  String productTitle;
  String productPrice;
  String productOldPrice;
  String offerText;

  Products(this.productId, this.productImage, this.productTitle,
      this.productPrice, this.productOldPrice, this.offerText);
}

Future<List<Products>> loadProducts() async {
  var jsonString = await rootBundle.loadString('assets/json/womens_wear.json');
  final jsonResponse = json.decode(jsonString);

  List<Products> products = [];

  for (var o in jsonResponse) {
    Products product = Products(o["productId"], o["productImage"],
        o["productTitle"], o["price"], o["oldPrice"], o["offer"]);

    products.add(product);
  }

  return products;
}
