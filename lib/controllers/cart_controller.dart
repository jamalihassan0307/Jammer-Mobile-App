import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
// import 'package:jammer_mobile_app/data/network/APIStore.dart';
// import 'package:jammer_mobile_app/data/network/base_api_services.dart';
import 'package:jammer_mobile_app/data/network/network_api_services.dart';
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

  double fullrating = 0;
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
      NetworkApiServices network = NetworkApiServices();
      final response1 = await network
          .deleteApi(StaticVariables.deleteCartItem + id.toString());

      if (kDebugMode) print("delete successfully${response1.data}");

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

  int numberofcart = 0;
  getTotal() {
    double total = 0;
    cartTotal = 0;
    cardlist.forEach((element) {
      total += double.parse(element.price) * element.quantity;
    });
    cartTotal = cartTotal = double.parse(total.toStringAsFixed(2));
    ;
    numberofcart = cardlist.length;
    update();
  }

  List<CartModel> cardlist = [];
  Future<void> getcart() async {
    try {
      cardlist.clear();
      NetworkApiServices network = NetworkApiServices();
      final response1 = await network.getApi(StaticVariables.getUserCart);

      List res = response1.data["data"];
      res.forEach((element) {
        cardlist.add(CartModel.fromMap(element));
      });
      if (kDebugMode) print("cardlist${cardlist.length}");

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

  double averageRating = 0.0;
  double total = 0.0;
  String value = "";
  getRating() {
    total = 0.0;
    averageRating = 0.0;
    for (int i = 0; i < reviewlist.length; i++) {
      double index = reviewlist[i].points;
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
      NetworkApiServices network = NetworkApiServices();
      final response1 = await network.getApi(StaticVariables.getReviewsId + id);

      List res = response1.data["data"];
      res.forEach((element) {
        reviewlist.add(ReviewModel.fromMap(element as Map<String, dynamic>));
      });
      getRating();
      update();
      if (kDebugMode) print("reviewlist${reviewlist.length}");

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

  Future<void> Addcart(PassDataToProduct p, int coupon) async {
    try {
      // print("lrgr;rwijiwow${coupon}");
      Map<String, dynamic> data = {
        "productId": p.productId,
        "quantity": 1,
        "couponId": coupon == 0 ? 0 : coupon
      };
      NetworkApiServices network = NetworkApiServices();
      final response1 = await network.postApi(StaticVariables.addToCart, data);

      if (kDebugMode) print("Add SuccessFully${response1}");
      Fluttertoast.showToast(
        msg: 'Add SuccessFully',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      update();
      getcart();

      // ignore: deprecated_member_use
    } on DioError catch (e) {
      print("ErrrrorAddcart${e.message.toString() + e.response.toString()}");
      Fluttertoast.showToast(
        msg: e.message.toString() + e.response.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  Future<void> AddReview(int p, String sms) async {
    try {
      Map<String, dynamic> data = {
        "productId": p,
        "message": sms,
        "points": fullrating
      };
      NetworkApiServices network = NetworkApiServices();
      final response1 = await network.postApi(StaticVariables.addReviews, data);
      int id = DateTime.now().microsecond;
      if (kDebugMode) print("AddReview SuccessFully${response1}");
      ReviewModel model = ReviewModel(
          createdAt: "",
          fullname: StaticVariables.model!.fullName,
          id: id,
          image: StaticVariables.model!.image,
          message: sms,
          points: fullrating,
          productId: p,
          userId: int.parse(StaticVariables.model!.id));
      reviewlist.add(model);
      getRating();
      Fluttertoast.showToast(
        msg: 'Add SuccessFully',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      update();
      getcart();

      // ignore: deprecated_member_use
    } on DioError catch (e) {
      print("ErrrrorAddcart${e.message.toString() + e.response.toString()}");
      Fluttertoast.showToast(
        msg: e.message.toString() + e.response.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  Future<void> updateCartQuantity() async {
    try {
      for (var item in cardlist) {
        Map<String, dynamic> data = {
          "quantity": item.quantity,
          "cartid": item.id,
        };
        NetworkApiServices network = NetworkApiServices();
        final response = await network.putApi(
          StaticVariables.updateCartItem,
          data,
        );

        if (kDebugMode) print("Quantity Updated Successfully: $response");

        // Fluttertoast.showToast(
        //   msg: 'Quantity Updated Successfully',
        //   backgroundColor: Colors.green,
        //   textColor: Colors.white,
        // );
        getcart();
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
        cardlist.indexWhere((element) => element.productId == model.productId);

    if (index != -1) {
      if (isIncrement) {
        print("Before increment: ${cardlist[index].quantity}");
        cardlist[index].quantity += 1;
        print("After increment: ${cardlist[index].quantity}");
      } else {
        print("Before decrement: ${cardlist[index].quantity}");
        cardlist[index].quantity -= 1;
        print("After decrement: ${cardlist[index].quantity}");

        if (cardlist[index].quantity <= 0) {
          cardlist.removeAt(index);
          print("Product removed from cart");
        }
      }
      getTotal();

      // cartTotal = cartTotal * cardlist[index].quantity;
      print("ProductcartTotal ${cartTotal}");
      update();
    } else {
      print("ProductcartTotal ${cartTotal}");
    }
  }
}
