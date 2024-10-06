import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/view_model/controllers/home/home_controller.dart';
import 'package:jammer_mobile_app/view_model/controllers/wishlist/wishlist_controller.dart';
import 'package:jammer_mobile_app/res/app_url/static_variables.dart';
import 'package:jammer_mobile_app/res/components/functions/passDataToProduct.dart';
import 'package:jammer_mobile_app/models/Product/RandamProduct.dart';
import 'package:jammer_mobile_app/view/pages/product/product.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List<Color> beautifulColors = [
  Color(0xFF87CEFA), // Light Sky Blue
  Color(0xFFFFC1CC), // Soft Pink
  Color(0xFF98FF98), // Mint Green
  Color(0xFFE6E6FA), // Lavender
  Color(0xFFFFDAB9), // Peach
  Color(0xFFFFFDE0), // Pale Yellow
  Color(0xFFF08080), // Light Coral
  Color(0xFFB0E0E6), // Powder Blue
  Color(0xFFE0BBE4), // Light Lavender
  Color(0xFFFFFDD0), // Cream
];

class BestDealGrid extends StatefulWidget {
  BestDealGrid({super.key});

  @override
  State<BestDealGrid> createState() => _BestDealGridState();
}

class _BestDealGridState extends State<BestDealGrid> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<HomeController>(builder: (obj) {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
        width: width - 20.0,
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          children: List.generate(
            obj.randomCouponProductslist.length,
            (index) {
              Color bg = beautifulColors[index % beautifulColors.length];
              RandomProducts model = obj.randomCouponProductslist[index];
              return InkWell(
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: bg,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Container(
                                margin: const EdgeInsets.all(15.0),
                                child: model.imagePaths.isEmpty
                                    ? Image.asset(
                                        "assets/best_deal/best_deal_1.jpg",
                                        fit: BoxFit.contain,
                                      )
                                    : Image.network(
                                        StaticVariables.baseurl +
                                            model.imagePaths[0],
                                        fit: BoxFit.contain,
                                      ),
                              ),
                            ),
                          ),
                          GetBuilder<WishListController>(builder: (obj) {
                            return InkWell(
                              onTap: () {
                                if (!obj.wishList.any((element) =>
                                    element.productId == model.productId)) {
                                  obj.color = Colors.red;
                                  PassDataToProduct products =
                                      PassDataToProduct(
                                          model.productName,
                                          model.productId,
                                          [],
                                          model.price.toString(),
                                          model.price.toString(),
                                          "d",
                                          "d");
                                  obj.AddWishList(products, model.couponid!);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Added to Wishlist")));
                                } else {
                                  obj.color = Colors.grey;
                                  obj.removeWishList(obj.wishList
                                      .where((element) =>
                                          element.productId == model.productId)
                                      .firstOrNull!
                                      .id);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Remove from Wishlist")));
                                }
                              },
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: obj.wishList.any(
                                            (element) =>
                                                element.productId ==
                                                model.productId)
                                        ? Colors.white.withOpacity(0.5)
                                        : Colors.grey.shade800.withOpacity(0.5),
                                    radius: 17,
                                    child: Icon(
                                      obj.wishList.any((element) =>
                                              element.productId ==
                                              model.productId)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: obj.wishList.any((element) =>
                                              element.productId ==
                                              model.productId)
                                          ? Colors.red
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              model.productName,
                              style: const TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: height * 0.01),
                            model.discountType == "FLAT"
                                ? RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'RS ${model.discountedPrice}  ',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0),
                                        ),
                                        TextSpan(
                                          text: 'RS ${model.price} ',
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13.0,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: ' RS ${model.discountedPrice}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0),
                                        ),
                                        TextSpan(
                                          text: ' ${model.discount}% OFF',
                                          style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 13.0),
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  PassDataToProduct product = PassDataToProduct(
                      model.productName,
                      model.productId,
                      model.imagePaths,
                      model.discountedPrice.toString(),
                      model.price.toString(),
                      model.description.toString(),
                      model.discountType == "FLAT"
                          ? "OFF ${model.discount}"
                          : "OFF ${model.discount} %");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductPage(
                              bg: bg,
                              productData: product,
                              coupon: model.couponid ?? 0,
                            )),
                  );
                },
              );
            },
          ),
        ),
      );
    });
  }
}
