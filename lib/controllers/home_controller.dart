import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
import 'package:jammer_mobile_app/data/network/APIStore.dart';
import 'package:jammer_mobile_app/models/GetCouponsWithProducts%20.dart';
import 'package:jammer_mobile_app/models/RandamProduct.dart';
import 'package:jammer_mobile_app/models/banner_model.dart';
import 'package:jammer_mobile_app/models/get_category_model.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  ///////loading ///////

  void init() {
    updateloading(true);
    getCategory();
    getRandomCouponProducts();
    GetCouponsWithProductsdata();
    GetBanner();
    updateloading(false);
    update();
  }

  bool loading = false;
  updateloading(bool load) {
    loading = load;
    update();
  }

  List<GetCategoryModel> category = [];
  Future<void> getCategory() async {
    try {
      final response1 =
          await httpClient().get(StaticVariables.getAllCategories);
      if (response1.statusCode == 200) {
        List res = response1.data["data"];
        res.forEach((element) {
          category.add(GetCategoryModel.fromMap(element));
        });
        update();
        if (kDebugMode) print("category${category}");
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

  List<GetCouponsWithProducts> couponproductlist = [];
  Future<void> GetCouponsWithProductsdata() async {
    try {
      print("get data");
      final response1 =
          await httpClient().get(StaticVariables.getCouponsWithProducts);
      if (response1.statusCode == 200) {
        List res = response1.data["data"];
        res.forEach((element) {
          couponproductlist.add(GetCouponsWithProducts.fromMap(element));
        });

        if (kDebugMode) print("couponproductlist${category}");
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

  List<BannerModel> bannerList = [];
  Future<void> GetBanner() async {
    try {
      print("get data");
      final response1 = await httpClient().get(StaticVariables.getAllBanners);
      if (response1.statusCode == 200) {
        List res = response1.data["data"];
        res.forEach((element) {
          bannerList.add(BannerModel.fromJson(element));
        });

        if (kDebugMode) print("banner${bannerList}");
      } else {
        // Fluttertoast.showToast(
        //   msg: 'User data Not Found',
        //   backgroundColor: Colors.red,
        //   textColor: Colors.white,
        // );
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

  List<RandamProduct> randomCouponProductslist = [];
  Future<void> getRandomCouponProducts() async {
    try {
      final response1 =
          await httpClient().get(StaticVariables.getRandomCouponProducts);
      if (response1.statusCode == 200) {
        List res = response1.data["data"];
        res.forEach((element) {
          randomCouponProductslist.add(RandamProduct.fromMap(element));
        });

        if (kDebugMode)
          print("randomCouponProductslist${randomCouponProductslist}");
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

  List<RandamProduct> cartlist = [];
  Future<void> getUserCart() async {
    try {
      final response1 = await httpClient().get(StaticVariables.getUserCart);
      if (response1.statusCode == 200) {
        List res = response1.data["data"];
        res.forEach((element) {
          randomCouponProductslist.add(RandamProduct.fromMap(element));
        });

        if (kDebugMode)
          print("randomCouponProductslist${randomCouponProductslist}");
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
