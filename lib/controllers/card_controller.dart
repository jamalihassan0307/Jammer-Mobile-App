import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
import 'package:jammer_mobile_app/data/network/APIStore.dart';
import 'package:jammer_mobile_app/functions/passDataToProduct.dart';
import 'package:jammer_mobile_app/models/CartModel.dart';
import 'package:jammer_mobile_app/models/review_model.dart';

class CartController extends GetxController {
  static CartController get to => Get.find();

  void init() {
    updateloading(true);
    getcart();
    updateloading(false);
    update();
  }

  bool loading = false;
  updateloading(bool load) {
    loading = load;
    update();
  }

  double cartTotal = 0;
  removecart(int index, int id) {
    cardlist.removeAt(index);
    getTotal();
    removeAPisCart(id);
    update();
  }

  Future<void> removeAPisCart(int id) async {
    try {
      final response1 = await httpClient()
          .delete(StaticVariables.deleteCartItem + id.toString());
      if (response1.statusCode == 200) {
        if (kDebugMode) print("delete successfully");
      } else {
        Fluttertoast.showToast(
          msg: 'Cart Not Found',
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
  }

  int numberofcart = 0;
  getTotal() {
    double total = 0;
    cartTotal = 0;
    cardlist.forEach((element) {
      total += double.tryParse(element.price) ?? 0;
    });
    cartTotal = total;
    numberofcart = cardlist.length;
    update();
  }

  List<CartModel> cardlist = [];
  Future<void> getcart() async {
    try {
      cardlist = [];
      final response1 = await httpClient().get(StaticVariables.getUserCart);
      if (response1.statusCode == 200) {
        List res = response1.data["data"];
        res.forEach((element) {
          cardlist.add(CartModel.fromMap(element));
        });
        if (kDebugMode) print("cardlist${cardlist.length}");
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
      Fluttertoast.showToast(
        msg: e.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  double averageRating = 0.0;
  double total = 0.0;
  String value = "";
  getRating() {
    total = 0.0;
    averageRating = 0.0;
    for (int i = 0; i < reviewlist.length; i++) {
      double index = double.tryParse(reviewlist[i].points.toString()) ?? 0.0;
      averageRating = averageRating + index;
    }
    total = averageRating;
    averageRating = (averageRating / reviewlist.length);

    value = averageRating.toStringAsFixed(1);
    update();
  }

  List<ReviewModel> reviewlist = [];
  Future<void> getreview(String id) async {
    try {
      reviewlist.clear();
      final response1 =
          await httpClient().get(StaticVariables.getReviewsId + id);
      if (response1.statusCode == 200) {
        List res = response1.data["data"];
        res.forEach((element) {
          reviewlist.add(ReviewModel.fromJson(element));
        });
        getRating();
        update();
        if (kDebugMode) print("reviewlist${reviewlist.length}");
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
  }

  Future<void> Addcart(PassDataToProduct p) async {
    try {
      Map<String, dynamic> data = {"productId": p.productId, "quantity": 1};
      final response1 =
          await httpClient().post(StaticVariables.addToCart, data: data);
      if (response1.statusCode == 200) {
        if (kDebugMode) print("Add SuccessFully");
        update();
        getcart();
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
  }
}
