// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
import 'package:jammer_mobile_app/data/network/network_api_services.dart';
import 'package:jammer_mobile_app/future.dart';
import 'package:jammer_mobile_app/models/login_model.dart';
import 'package:jammer_mobile_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:jammer_mobile_app/utils/static_variable.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  bool obscureText = true;
  DateTime? currentBackPressTime;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Toggles the password visibility
  viewPassword() {
    obscureText = !obscureText;
    update(['viewPassword']);
  }

  // Handles the login process
  Future<void> login() async {
    // final String email = emailController.text;
    // final String password = passwordController.text;

    // if (email.isEmpty || password.isEmpty) {
    //   Fluttertoast.showToast(
    //     msg: 'Please enter both email and password',
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //   );
    //   return;
    // }
    var login = Login();
    var data = GetUserById();
    LoginModel logindata = LoginModel.fromMap(login);

    UserModel model = UserModel.fromMap(data);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', logindata.token);
    await prefs.setString('UserId', model.id);
    StaticVariables.tokenid = logindata.token;
    StaticVariables.userid = model.id;
    StaticVariables.model = model;
    print("usermodel${model}");
  }

  // Validation error messages
  String? emailError;
  String? passwordError;
  bool validateLogin() {
    bool isValid = true;

    // Reset error messages
    emailError = null;
    passwordError = null;

    // Validate email
    if (emailController.text.isEmpty) {
      emailError = "Email cannot be empty";
      isValid = false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      emailError = "Enter a valid email address";
      isValid = false;
    }

    // Validate password
    if (passwordController.text.isEmpty) {
      passwordError = "Password cannot be empty";
      isValid = false;
    } else if (passwordController.text.length < 6) {
      passwordError = "Password must be at least 6 characters";
      isValid = false;
    }

    // Update the UI to display errors
    update(['emailField', 'passwordField']);
    return isValid;
  }

  // Handles back button press
  bool onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return false;
    } else {
      return true;
    }
  }
}
