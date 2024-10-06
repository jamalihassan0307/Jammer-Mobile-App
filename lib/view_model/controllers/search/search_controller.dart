import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/res/app_url/static_variables.dart';
import 'package:jammer_mobile_app/data/network/network_api_services.dart';
import 'package:jammer_mobile_app/models/Product/RandamProducts20.dart';

class SearchPController extends GetxController {
  static SearchPController get to => Get.find();
  TextEditingController searchcontroller = TextEditingController();

  bool loading = false;

  updateloading(bool load) {
    loading = load;
    // update();
  }

  void init() {
    updateloading(true);
    getAllProduct();

    searchlist.clear();
    updateloading(false);
    update();
  }

  List<RandomProducts20> randomProducts20list = [];
  getAllProduct() async {
    try {
      randomProducts20list.clear();
      NetworkApiServices network = NetworkApiServices();
      final response1 =
          await network.getApi(StaticVariables.getProductsWithPaging);

      List res = response1.data["data"];
      res.forEach((element) {
        randomProducts20list.add(RandomProducts20.fromMap(element));
      });

      if (kDebugMode) print("randomProducts20list${randomProducts20list}");
      update();
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

  List<RandomProducts20> searchlist = [];
  serchProduct(String q) async {
    searchlist.clear();
    try {
      NetworkApiServices network = NetworkApiServices();
      final response1 =
          await network.getApi(StaticVariables.searchProductsByName + q);

      List res = response1.data["data"];
      res.forEach((element) {
        searchlist.add(RandomProducts20.fromMap(element));
      });
      update();
      if (kDebugMode) print("searchlist${searchlist}");

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
