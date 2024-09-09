import 'package:jammer_mobile_app/models/user_model.dart';

class StaticVariables {
  static UserModel? model;
  static String? userid;
  static String? tokenid;
  static String baseurl = "http://192.168.100.100:3300";

  static String url = "http://192.168.100.100:3300/api/";
  ///////////////////////////////urls/////////////////////
  static String login = "Users/Login";
  static String getUserById = "Users/GetUserById";

  ////////////////////Category/////////////
  static String getAllCategories = "Category/GetAllCategories";

  ////////////////////Cart/////////////
  static String addToCart = "Cart/AddToCart";
  static String getUserCart = "Cart/GetUserCart";
  static String getCartById = "Cart/GetCartById/";
  static String deleteCartItem = "Cart/DeleteCartItem/";
  static String updateCartItem = "Cart/UpdateCartItem/";
  ////////////////////WishList/////////////
  static String addWishList = "WishList/AddWishList";
  static String getUserWishList = "WishList/GetUserWishList";
  static String getWishListById = "Cart/GetWishListById/";
  static String deleteWishListItem = "Cart/DeleteWishListItem/";
  static String updateWishListItem = "Cart/UpdateWishListItem/";
  ////////////////////Product/////////////

  static String filterProductsByCategory = "Product/FilterProductsByCategory/";
  ////////////////////Review/////////////

  static String getReviewsId = "Review/GetReviews/";
  ////////////////////Coupon/////////////
  static String getRandomCouponProducts = "Coupon/GetRandomCouponProducts";
  static String getCouponsWithProducts = "Coupon/GetCouponsWithProducts";
  static String getProductsByCouponid = "Coupon/GetProductsByCoupon/";
  // static String getRandomCouponProducts = "Coupon/GetRandomCouponProducts";
  ////////////////////Oder/////////////

  static String createOrder = "Order/CreateOrder";
  static String getOrderById = "Order/GetOrderById/";
  static String updateOrderStatus = "Order/UpdateOrderStatus/";
  static String getOrdersByUserId = "Order/GetOrdersByUserId/";
}
