import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
import 'package:jammer_mobile_app/data/network/APIStore.dart';
import 'package:jammer_mobile_app/functions/passDataToProduct.dart';
import 'package:jammer_mobile_app/models/CartModel.dart';

class WishListController extends GetxController {
  static WishListController get to => Get.find();

  void init() {
    updateloading(true);
    getWishList();
    updateloading(false);
    update();
  }

  bool loading = false;
  updateloading(bool load) {
    loading = load;
    update();
  }

  double wishListTotal = 0;
  removeWishList(int index, int id) {
    wishList.removeAt(index);
    getTotal();
    removeAPisWishList(id);
    update();
  }

  Future<void> removeAPisWishList(int id) async {
    try {
      final response1 = await httpClient()
          .delete(StaticVariables.deleteWishListItem + id.toString());
      if (response1.statusCode == 200) {
        if (kDebugMode) print("delete successfully");
      } else {
        Fluttertoast.showToast(
          msg: 'WishList Not Found',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      print("Errrror${e}");
      Fluttertoast.showToast(
        msg: e.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  int numberofWishList = 0;
  getTotal() {
    double total = 0;
    wishListTotal = 0;
    wishList.forEach((element) {
      total += double.tryParse(element.price) ?? 0;
    });
    wishListTotal = double.parse(total.toStringAsFixed(2));
    ;
    numberofWishList = wishList.length;
    update();
  }

  List<CartModel> wishList = [];
  Future<void> getWishList() async {
    try {
      final response1 = await httpClient().get(StaticVariables.getUserWishList);
      if (response1.statusCode == 200) {
        wishList.clear();
        List res = response1.data["data"];
        res.forEach((element) {
          wishList.add(CartModel.fromMap(element));
        });
        if (kDebugMode) print("wishListlist${wishList.length}");
      } else {
        Fluttertoast.showToast(
          msg: 'User data Not Found',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
      getTotal();
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      print("Errrror${e}");
      Fluttertoast.showToast(
        msg: e.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  Future<void> AddWishList(PassDataToProduct p, int coupon) async {
    try {
      Map<String, dynamic> data = {
        "productId": p.productId,
        "quantity": 1,
        "couponId": coupon == 0 ? null : coupon
      };
      final response1 =
          await httpClient().post(StaticVariables.addWishList, data: data);
      if (response1.statusCode == 200) {
        if (kDebugMode) print("Add SuccessFully");
        update();
        getWishList();
      } else {
        Fluttertoast.showToast(
          msg: 'User data Not Found',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      print("Errrror${e}");
      Fluttertoast.showToast(
        msg: e.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}
