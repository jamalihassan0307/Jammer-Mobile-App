import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
// import 'package:jammer_mobile_app/data/network/APIStore.dart';
import 'package:jammer_mobile_app/data/network/network_api_services.dart';
import 'package:jammer_mobile_app/models/ProductsByCategory%20.dart';
import 'package:jammer_mobile_app/models/GetCouponsWithProducts .dart'
    as product;

class TopOfferController extends GetxController {
  static TopOfferController get to => Get.find();
  bool progress = false;
  List<ProductsByCategory> couponproductlist = [];
  Future<void> getproduct(String id, bool coupon) async {
    updateloading(true);
    couponproductlist = [];

    if (kDebugMode) print("couponcouponcoupon${coupon}");
    try {
      print("get data");
      NetworkApiServices network = NetworkApiServices();
      final response1 = await network.getApi(coupon == true
          ? StaticVariables.getProductsByCouponid + id
          : StaticVariables.filterProductsByCategory + id);
      List res = response1.data["data"];
      res.forEach((element) {
        if (!coupon)
          couponproductlist.add(ProductsByCategory.fromMap(element));
        else {
          product.Products model = product.Products.fromMap(element);
          List<String> list =
              model.imagePaths.map((e) => e.toString()).toList();

          ProductsByCategory convert = ProductsByCategory(
              id: model.productId.toString(),
              name: model.productName,
              description: model.description,
              price: model.price,
              stockQuantity: model.stockQuantity,
              categoryId: "null",
              imagePath: list,
              createdAt: "null",
              updatedAt: "null");
          couponproductlist.add(convert);
          update();
        }
      });

      if (kDebugMode) print("couponproductlist${couponproductlist}");
      if (kDebugMode) print("response1${response1.statusCode}");

      // ignore: deprecated_member_use
    } on DioError catch (e) {
      print("Errrror${e.response.toString() + e.message.toString()}");
      Fluttertoast.showToast(
        msg: e.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }

    updateloading(false);
  }

  updateloading(bool load) {
    progress = load;
    update();
  }
}
