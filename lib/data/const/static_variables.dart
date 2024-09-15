import 'package:flutter/material.dart';
import 'package:jammer_mobile_app/models/user_model.dart';
import 'package:jammer_mobile_app/view/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StaticVariables {
  static UserModel? model;
  static String? userid;
  static String? tokenid;
  static String baseurl = "http://192.168.1.100:3300";

  static String url = "http://192.168.1.100:3300/api/";
  ///////////////////////////////urls/////////////////////
  static String login = "Users/Login";
  static String signup = "Users/Signup";
  static String getUserById = "Users/GetUserById";

  ////////////////////Category/////////////
  static String getAllCategories = "Category/GetAllCategories";

  ////////////////////Banner/////////////
  static String getAllBanners = "Banner/GetAllBanners";

  ////////////////////Cart/////////////
  static String addToCart = "Cart/AddToCart";
  static String getUserCart = "Cart/GetUserCart";
  static String getCartById = "Cart/GetCartById/";
  static String deleteCartItem = "Cart/DeleteCartItem/";
  static String updateCartItem = "Cart/UpdateCartItem";
  static String deleteAllUserCart = "Cart/DeleteAllUserCart";
  ////////////////////WishList/////////////
  static String addWishList = "WishList/AddWishList";
  static String getUserWishList = "WishList/GetUserWishList";
  static String getWishListById = "WishList/GetWishListById/";
  static String deleteWishListItem = "WishList/DeleteWishListItem/";
  static String updateWishListItem = "WishList/UpdateWishListItem";
  static String deleteAllUserWishList = "WishList/DeleteAllUserWishList";
  ////////////////////Product/////////////

  static String filterProductsByCategory = "Product/FilterProductsByCategory/";
  ////////////////////Review/////////////

  static String getReviewsId = "Review/GetReviews/";
  static String addReviews = "Review/AddReview";
  ////////////////////Coupon/////////////
  static String getRandomCouponProducts = "Coupon/GetRandomCouponProducts";
  static String getCouponsWithProducts = "Coupon/GetCouponsWithProducts";
  static String getProductsByCouponid = "Coupon/GetProductsByCoupon/";
  // static String getRandomCouponProducts = "Coupon/GetRandomCouponProducts";
  ////////////////////Oder/////////////

  static String createOrder = "Order/CreateOrder";
  static String cencalOrder = "Order/CancelOrder/";
  static String getOrderById = "Order/GetOrderById/";
  static String updateOrderStatus = "Order/UpdateOrderStatus/";
  static String getOrdersByUserId = "Order/GetOrdersByUserId/";
  static logout(BuildContext context) async {
    try {
      SharedPreferences a = await SharedPreferences.getInstance();
      a.getKeys();
      a.clear();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => const Login()), (r) => true);
    } catch (e) {
      print("heloo ${e.toString()}.");
    }
  }
}
