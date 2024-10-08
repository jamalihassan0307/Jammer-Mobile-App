// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/view_model/controllers/cart/cart_controller.dart';
import 'package:jammer_mobile_app/res/app_url/static_variables.dart';
// import 'package:jammer_mobile_app/data/network/APIStore.dart';
import 'package:jammer_mobile_app/data/network/network_api_services.dart';
// import 'package:jammer_mobile_app/functions/passDataToProduct.dart';
import 'package:jammer_mobile_app/models/cart/CartModel.dart';
// import 'package:jammer_mobile_app/models/CartModel.dart';
import 'package:jammer_mobile_app/models/order/get_order_model.dart';

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
      orderList.clear();
      NetworkApiServices network = NetworkApiServices();
      final response1 = await network.getApi(StaticVariables.getOrdersByUserId);
      List res = response1.data["data"];
      res.forEach((element) {
        orderList.add(GetOrderModel.fromJson(element));
      });

      if (kDebugMode) print("orderListorderList: $orderList");

      orderList.sort((a, b) {
        DateTime dateA = DateTime.parse(a.orderDate!);
        DateTime dateB = DateTime.parse(b.orderDate!);
        return dateB.compareTo(dateA); // Corrected line
      });

      update();
    } on DioError catch (e) {
      print("Error: ${e.response.toString() + e.message.toString()}");
      Fluttertoast.showToast(
        msg: e.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  Future<void> createOrderFromCart() async {
    try {
      List<Map<String, dynamic>> items = CartController.to.cardlist
          .map((element) => {
                "productId": element.productId,
                "quantity": element.quantity,
                "couponId": null
              })
          .toList();
      NetworkApiServices network = NetworkApiServices();
      final response1 =
          await network.postApi(StaticVariables.createOrder, {"items": items});

      if (kDebugMode) print("dOrder created successfully${response1.data}");
      Fluttertoast.showToast(
        msg: 'Order created successfully!',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      await clearCart();
    } catch (e) {
      if (kDebugMode) {
        print("errrrrrrrror of order  ${e}");
      }
    }
  }

  Future<void> cancelOrder(int orderId) async {
    NetworkApiServices network = NetworkApiServices();
    final response1 =
        await network.putApi1(StaticVariables.cencalOrder + orderId.toString());
    getOrder();
    if (kDebugMode) print("Order Cencal successfully!${response1.data}");
    Fluttertoast.showToast(
      msg: 'Order Cencal successfully!',
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
    getOrder();
  }

  Future<void> createOrder(List<CartModel> model, int type, String city,
      String street, String postalCode, String region) async {
    List<Map<String, dynamic>> items = [
      for (CartModel data in model)
        {
          "productId": data.productId,
          "quantity": data.quantity,
          "couponId": data.couponId
        }
    ];

    try {
      NetworkApiServices network = NetworkApiServices();
      final response1 = await network.postApi(
        StaticVariables.createOrder,
        {
          "city": city,
          "street": street,
          "postalCode": postalCode,
          "region": region,
          "items": items,
        },
      );

      if (kDebugMode) print("Order created successfully: ${response1.data}");
      Fluttertoast.showToast(
        msg: 'Order created successfully!',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      // Handle specific order types
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
      getOrder();
    } catch (e) {
      // Handle exceptions
      Fluttertoast.showToast(
        msg: 'Error occurred while creating order: $e',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  Future<void> clearCart() async {
    try {
      NetworkApiServices network = NetworkApiServices();
      final response1 =
          await network.deleteApi(StaticVariables.deleteAllUserCart);
      if (kDebugMode) print("Cart cleared successfully!y${response1.data}");
      Fluttertoast.showToast(
        msg: 'Cart cleared successfully!',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      await CartController.to.getcart();
    } on DioError catch (e) {
      print("Errrror${e.response.toString() + e.message.toString()}");
      Fluttertoast.showToast(
        msg: e.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  Future<void> clearWishList() async {
    try {
      NetworkApiServices network = NetworkApiServices();
      final response1 =
          await network.deleteApi(StaticVariables.deleteAllUserWishList);
      if (kDebugMode) print("delete successfully${response1.data}");
      Fluttertoast.showToast(
        msg: 'Cart cleared successfully!',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      await CartController.to.getcart();
    } on DioError catch (e) {
      print("Errrror${e.response.toString() + e.message.toString()}");
      Fluttertoast.showToast(
        msg: e.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}
