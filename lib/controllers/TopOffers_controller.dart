import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
import 'package:jammer_mobile_app/data/network/APIStore.dart';
import 'package:jammer_mobile_app/models/ProductsByCategory%20.dart';

class TopOfferController extends GetxController {
  static TopOfferController get to => Get.find();
  bool progress = false;
  List<ProductsByCategory> couponproductlist = [];
  Future<void> getproduct(String id) async {
    updateloading(true);
    couponproductlist = [];
    try {
      print("get data");
      final response1 =
          await httpClient().get(StaticVariables.filterProductsByCategory + id);
      if (response1.statusCode == 200) {
        List res = response1.data["data"];
        res.forEach((element) {
          couponproductlist.add(ProductsByCategory.fromMap(element));
        });

        if (kDebugMode) print("couponproductlist${couponproductlist}");
        if (kDebugMode) print("response1${response1.statusCode}");
      } else {
        Fluttertoast.showToast(
          msg: 'User data Not Found',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
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