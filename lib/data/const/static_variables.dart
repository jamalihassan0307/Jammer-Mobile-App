import 'package:jammer_mobile_app/models/user_model.dart';

class StaticVariables {
  static UserModel? model;
  static String? userid;
  static String? tokenid;
  static String baseurl = "http://192.168.1.100:3300";

  static String url = "http://192.168.1.100:3300/api/";
  ///////////////////////////////urls/////////////////////
  static String login = "Users/Login";
  static String getUserById = "Users/GetUserById";

  ////////////////////Category/////////////
  static String getAllCategories = "Category/GetAllCategories";
  ////////////////////Coupon/////////////
  static String getRandomCouponProducts = "Coupon/GetRandomCouponProducts";
  static String GetCouponsWithProducts = "Coupon/GetCouponsWithProducts";
  // static String getRandomCouponProducts = "Coupon/GetRandomCouponProducts";
}
