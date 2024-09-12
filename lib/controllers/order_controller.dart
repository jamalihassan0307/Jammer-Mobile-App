// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/controllers/cart_controller.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
import 'package:jammer_mobile_app/data/network/APIStore.dart';
import 'package:jammer_mobile_app/functions/passDataToProduct.dart';
import 'package:jammer_mobile_app/models/CartModel.dart';
// import 'package:jammer_mobile_app/models/CartModel.dart';
import 'package:jammer_mobile_app/models/get_order_model.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find();
  bool loading = false;
  updateloading(bool load) {
    loading = load;
    update();
  }

  void init() {
    updateloading(true);
    getOrder();
    updateloading(false);
    update();
  }

  List<GetOrderModel> orderList = [];
  Future<void> getOrder() async {
    try {
      orderList = [];
      final response1 =
          await httpClient().get(StaticVariables.getOrdersByUserId);
      if (response1.statusCode == 200) {
        List res = response1.data["data"];
        res.forEach((element) {
          orderList.add(GetOrderModel.fromJson(element));
        });
        // orderList.sort((a,b)=>a.items)
        if (kDebugMode) print("orderListorderList${orderList}");
      } else {
        Fluttertoast.showToast(
          msg: 'User data Not Found',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      print("Errrror${e.response.toString() + e.message.toString()}");
      Fluttertoast.showToast(
        msg: e.response.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  Future<void> createOrderFromCart() async {
    List<Map<String, dynamic>> items = CartController.to.cardlist
        .map((element) => {
              "productId": element.productId,
              "quantity": element.quantity,
              "couponId": null
            })
        .toList();

    final orderResponse = await httpClient()
        .post(StaticVariables.createOrder, data: {"items": items});

    if (orderResponse.statusCode == 200) {
      Fluttertoast.showToast(
        msg: 'Order created successfully!',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      await clearCart();
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to create order',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  Future<void> createOrder(List<CartModel> model, int type) async {
    List<Map<String, dynamic>> items = [
      for (CartModel data in model)
        {"productId": data.productId, "quantity": 1, "couponId": data.couponId}
    ];

    try {
      final orderResponse = await httpClient().post(
        StaticVariables.createOrder,
        data: {"items": items},
      );

      if (orderResponse.statusCode == 200) {
        Fluttertoast.showToast(
          msg: 'Order created successfully!',
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );

        switch (type) {
          case 0:
            // Type 0: Simple order
            break;
          case 1:
            // Type 1: Order from cart
            await clearCart(); // Clear the cart
            break;
          case 2:
            // Type 2: Order from wishlist
            await clearWishList(); // Clear the wishlist
            break;
          default:
            break;
        }
      } else {
        // Handle order creation failure
        Fluttertoast.showToast(
          msg:
              'Failed to create order: ${orderResponse.data["message"] ?? "Unknown error"}',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      // Handle exceptions
      Fluttertoast.showToast(
        msg: 'Error occurred while creating order: $e',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}

Future<void> clearCart() async {
  try {
    final response =
        await httpClient().delete(StaticVariables.deleteAllUserCart);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: 'Cart cleared successfully!',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      await CartController.to.getcart();
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to clear cart',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  } on DioError catch (e) {
    print("Errrror${e.response.toString() + e.message.toString()}");
    Fluttertoast.showToast(
      msg: e.response.toString(),
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}

Future<void> clearWishList() async {
  try {
    final response =
        await httpClient().delete(StaticVariables.deleteAllUserWishList);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: 'Cart cleared successfully!',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      await CartController.to.getcart();
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to clear cart',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  } on DioError catch (e) {
    print("Errrror${e.response.toString() + e.message.toString()}");
    Fluttertoast.showToast(
      msg: e.response.toString(),
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}
