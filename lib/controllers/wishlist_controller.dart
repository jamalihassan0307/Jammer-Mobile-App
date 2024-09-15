import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
// import 'package:jammer_mobile_app/data/network/APIStore.dart';
import 'package:jammer_mobile_app/data/network/network_api_services.dart';
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
  removeWishList(int id) {
    wishList.removeWhere((element) => element.id == id);
    getTotal();
    updatecolor(id);
    removeAPisWishList(id);
    update();
  }

  Future<void> removeAPisWishList(int id) async {
    try {
      if (kDebugMode) print("remove");
      print("REMOVEEEE ${id}");
      NetworkApiServices network = NetworkApiServices();
      final response1 = await network
          .deleteApi(StaticVariables.deleteWishListItem + id.toString());
      if (kDebugMode)
        print("removeAPisWishList delete successfully${response1.data}");

      if (kDebugMode) print("delete successfully");

      // ignore: deprecated_member_use
    } on DioError catch (e) {
      print("Errrror${e.response.toString() + e.message.toString()}");
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
      total += double.parse(element.price) * element.quantity;
    });

    wishListTotal = double.parse(total.toStringAsFixed(2));
    ;
    numberofWishList = wishList.length;
    update();
  }

  bool favourite = false;
  Color color = Colors.grey;
  updatefavourite(bool load) {
    favourite = load;
    update();
  }

  updatecolor(int id) {
    if (wishList.any((element) => element.productId == id)) {
      color = Colors.red;
    } else {
      color = Colors.grey;
    }
    update();
  }

  List<CartModel> wishList = [];
  Future<void> getWishList() async {
    try {
      NetworkApiServices network = NetworkApiServices();
      final response1 = await network.getApi(StaticVariables.getUserWishList);
      wishList.clear();
      List res = response1.data["data"];
      res.forEach((element) {
        wishList.add(CartModel.fromMap(element));
      });
      if (kDebugMode) print("wishListlist${wishList.length}");

      getTotal();
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      print("Errrror${e.response.toString() + e.message.toString()}");
      Fluttertoast.showToast(
        msg: e.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  Future<void> AddWishList(PassDataToProduct p, int coupon) async {
    try {
      if (kDebugMode) print("addddd");
      Map<String, dynamic> data = {
        "productId": p.productId,
        "quantity": 1,
        "couponId": coupon == 0 ? 0 : coupon
      };
      NetworkApiServices network = NetworkApiServices();
      final response1 =
          await network.postApi(StaticVariables.addWishList, data);

      if (kDebugMode) print("AddWishList ${response1.data}");
      if (kDebugMode) print("Add SuccessFully");
      update();
      getWishList();

      // ignore: deprecated_member_use
    } on DioError catch (e) {
      print("Errrror${e.response.toString() + e.message.toString()}");
      Fluttertoast.showToast(
        msg: e.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  Future<void> updateCartQuantity() async {
    try {
      for (var item in wishList) {
        Map<String, dynamic> data = {
          "quantity": item.quantity,
          "cartid": item.id,
        };
        NetworkApiServices network = NetworkApiServices();
        final response = await network.putApi(
          StaticVariables.updateWishListItem,
          data,
        );

        if (kDebugMode) print("Quantity Updated Successfully: $response");

        // Fluttertoast.showToast(
        //   msg: 'Quantity Updated Successfully',
        //   backgroundColor: Colors.green,
        //   textColor: Colors.white,
        // );
        getWishList();
        update();
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      print("Error: ${e.message.toString()}");
      Fluttertoast.showToast(
        msg: e.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void updateCartList(CartModel model, bool isIncrement) {
    print("productId: ${model.productId}, isIncrement: $isIncrement");

    int index =
        wishList.indexWhere((element) => element.productId == model.productId);

    if (index != -1) {
      if (isIncrement) {
        print("Before increment: ${wishList[index].quantity}");
        wishList[index].quantity += 1;
        print("After increment: ${wishList[index].quantity}");
      } else {
        print("Before decrement: ${wishList[index].quantity}");
        wishList[index].quantity -= 1;
        print("After decrement: ${wishList[index].quantity}");

        if (wishList[index].quantity <= 0) {
          wishList.removeAt(index);
          print("Product removed from cart");
        }
      }
      getTotal();

      // cartTotal = cartTotal * wishList[index].quantity;
      print("ProductcartTotal ${wishListTotal}");
      update();
    } else {
      print("ProductcartTotal ${wishListTotal}");
    }
  }
}
