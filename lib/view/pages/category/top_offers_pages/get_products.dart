// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_spinkit/flutter_spinkit.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/category/top_offers_pages/filter_row.dart';
import 'package:jammer_mobile_app/view/pages/product/product.dart';
import 'package:jammer_mobile_app/functions/passDataToProduct.dart';
import 'package:page_transition/page_transition.dart';

class GetProducts extends StatefulWidget {
  const GetProducts({super.key});

  @override
  _GetProductsState createState() => _GetProductsState();
}

class _GetProductsState extends State<GetProducts> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Products>>(
      future: loadProducts(),
      builder: (context, snapshot) {
        // ignore: avoid_print
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  const FilterRow(),
                  const Divider(
                    height: 1.0,
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: ProductsGridView(products: snapshot.data!)),
                ],
              )
            : Center(
                child: SpinKitFoldingCube(
                color: Theme.of(context).primaryColor,
                size: 35.0,
              ));
      },
    );
  }
}

class ProductsGridView extends StatefulWidget {
  final List<Products>? products;

  const ProductsGridView({Key? key, this.products}) : super(key: key);

  @override
  _ProductsGridViewState createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  InkWell getStructuredGridCell(Products products) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(5.0),
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
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: Hero(
                  tag: products.productTitle,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage(products.productImage[0]),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5.0),
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
            PageTransition(
                type: PageTransitionType.fade,
                duration: const Duration(microseconds: 600),
                child: ProductPage(
                  productData: PassDataToProduct(
                      products.productTitle,
                      products.productId,
                      products.productImage,
                      products.productPrice,
                      products.productOldPrice,
                      products.offerText),
                )));
      },
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
  List<String> productImage;
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
