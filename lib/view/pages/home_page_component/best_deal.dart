import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/controllers/home_controller.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
import 'package:jammer_mobile_app/functions/passDataToProduct.dart';
import 'package:jammer_mobile_app/models/RandamProduct.dart';
import 'package:jammer_mobile_app/view/pages/product/product.dart';

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

    // InkWell getStructuredGridCell(bestDeal) {
    //   final item = bestDeal;
    //   return InkWell(
    //     child: Image(
    //       image: AssetImage(item['image']),
    //       fit: BoxFit.fitHeight,
    //     ),
    //     onTap: () {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => TopOffers(title: '${item['title']}')),
    //       );
    //     },
    //   );
    // }

    return GetBuilder<HomeController>(builder: (obj) {
      return Container(
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
          width: width - 20.0,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              crossAxisCount: 2,
              childAspectRatio: ((width) / 500),
            ),
            itemCount: obj.randomCouponProductslist.length >= 4
                ? 4
                : obj.randomCouponProductslist.length,
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(0),
            itemBuilder: (BuildContext context, int index) {
              RandamProduct model = obj.randomCouponProductslist[index];
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
                        child: Container(
                          height: double.infinity,
                          margin: const EdgeInsets.all(6.0),
                          child: model.imagePaths.length == 0
                              ? Image(
                                  image: AssetImage(
                                      "assets/best_deal/best_deal_1.jpg"),
                                  fit: BoxFit.fitHeight,
                                )
                              : Image.network(
                                  StaticVariables.baseurl + model.imagePaths[0],
                                  fit: BoxFit.fitHeight,
                                ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 6.0, left: 6.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              model.productName,
                              style: const TextStyle(fontSize: 12.0),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                            ),
                            model.discountType == "FLAT"
                                ? RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '${model.discountedPrice}RS  ',
                                          style: const TextStyle(
                                              color: Color(0xFF67A86B),
                                              fontSize: 15.0),
                                        ),
                                        TextSpan(
                                          text: '${model.price}RS',
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
                                          text: '${model.discountedPrice} RS ',
                                          style: const TextStyle(
                                              color: Color(0xFF67A86B),
                                              fontSize: 15.0),
                                        ),
                                        TextSpan(
                                          text: '${model.discount}% OFF',
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15.0),
                                        ),
                                      ],
                                    ),
                                  ),
                            Text(
                              model.description,
                              style: const TextStyle(fontSize: 12.0),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
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
                              productData: product,
                              coupon: model.couponid,
                            )),
                  );
                },
              );
            },
          ));
    });
  }
}
