import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/view_model/controllers/order/order_controller.dart';
import 'package:jammer_mobile_app/res/app_url/static_variables.dart';
// import 'package:jammer_mobile_app/data/network/APIStore.dart';
import 'package:jammer_mobile_app/data/network/network_api_services.dart';
import 'package:jammer_mobile_app/models/coupon/GetCouponsWithProducts%20.dart';
import 'package:jammer_mobile_app/models/Product/RandamProduct.dart';
import 'package:jammer_mobile_app/models/banner/banner_model.dart';
import 'package:jammer_mobile_app/models/Product/get_category_model.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  ///////loading ///////

  init() {
    updateloading(true);
    getCategory();
    getRandomCouponProducts();
    GetCouponsWithProductsdata();
    GetBanner();
    OrderController.to.init();
    updateloading(false);
    update();
    return null;
  }

  bool loading = false;
  updateloading(bool load) {
    loading = load;
    // update();
  }

  List<GetCategoryModel> category = [];
  Future<void> getCategory() async {
    try {
      category.clear();
      NetworkApiServices network = NetworkApiServices();
      final response1 = await network.getApi(StaticVariables.getAllCategories);

      List res = response1.data["data"];
      res.forEach((element) {
        category.add(GetCategoryModel.fromMap(element));
      });
      update();
      if (kDebugMode) print("category${category}");

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

  RandomProducts? bannerProduct;
  Future<void> getBannerProduct(int q, int coupon) async {
    updateloading(true);
    bannerProduct = null;
    try {
      NetworkApiServices network = NetworkApiServices();
      final response1 = await network.getApi(
          StaticVariables.getProductByProductIdCouponId +
              coupon.toString() +
              "/" +
              q.toString());
      if (response1.data["data"] == null) {
        Fluttertoast.showToast(
          msg: response1.data["message"],
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        bannerProduct = null;
        return;
      }

      var res = response1.data["data"];
      bannerProduct = RandomProducts.fromMap(res);
      update();
      if (kDebugMode) print("bannerProduct${bannerProduct}");

      // ignore: deprecated_member_use
    } on DioError catch (e) {
      print("Errrror${e.response.toString() + e.message.toString()}");
      Fluttertoast.showToast(
        msg: e.response!.data["message"],
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    updateloading(false);
  }

  List<GetCouponsWithProducts> couponproductlist = [];
  Future<void> GetCouponsWithProductsdata() async {
    try {
      couponproductlist.clear();
      print("get data");
      NetworkApiServices network = NetworkApiServices();
      final response1 =
          await network.getApi(StaticVariables.getCouponsWithProducts);

      List res = response1.data["data"];
      res.forEach((element) {
        couponproductlist.add(GetCouponsWithProducts.fromMap(element));
      });
      update();
      if (kDebugMode) print("couponproductlist${category}");

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

  List<BannerModel> bannerList = [];
  Future<void> GetBanner() async {
    try {
      bannerList.clear();
      print("get data");
      NetworkApiServices network = NetworkApiServices();
      final response1 = await network.getApi(StaticVariables.getAllBanners);
      List res = response1.data["data"];
      res.forEach((element) {
        bannerList.add(BannerModel.fromJson(element));
      });

      if (kDebugMode) print("banner${bannerList}");

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

  List<RandomProducts> randomCouponProductslist = [];
  Future<void> getRandomCouponProducts() async {
    try {
      randomCouponProductslist.clear();
      NetworkApiServices network = NetworkApiServices();
      final response1 =
          await network.getApi(StaticVariables.getRandomCouponProducts);

      List res = response1.data["data"];
      res.forEach((element) {
        randomCouponProductslist.add(RandomProducts.fromMap(element));
      });

      if (kDebugMode)
        print("randomCouponProductslist${randomCouponProductslist}");

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

  List<RandomProducts> cartlist = [];
  Future<void> getUserCart() async {
    try {
      cartlist.clear();
      NetworkApiServices network = NetworkApiServices();
      final response1 = await network.getApi(StaticVariables.getUserCart);

      List res = response1.data["data"];
      res.forEach((element) {
        randomCouponProductslist.add(RandomProducts.fromMap(element));
      });

      if (kDebugMode)
        print("randomCouponProductslist${randomCouponProductslist}");

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
}
