// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
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
    final String email = emailController.text;
    final String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Please enter both email and password',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    // try {
    //   final response = await httpClient().post(
    //     'Users/Login',
    //     data: {
    //       'email': email,
    //       'password': password,
    //     },
    //   );

    //   if (response.statusCode == 200) {
    //     final data = response.data;
    //     Fluttertoast.showToast(
    //       msg: data['message'],
    //       backgroundColor: Colors.green,
    //       textColor: Colors.white,
    //     );

    //     // Save token to SharedPreferences
    //     SharedPreferences prefs = await SharedPreferences.getInstance();
    //     await prefs.setString('token', data['data']);
    //     StaticVariables.token = data['data'];

    //     // Navigate to home screen or desired page
    //     Get.offAllNamed('/home'); // Replace with your home route
    //   } else {
    //     Fluttertoast.showToast(
    //       msg: 'Login failed. Please try again.',
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //     );
    //   }
    // } on DioError catch (e) {
    //   Fluttertoast.showToast(
    //     msg: e.response?.data['message'] ?? 'An error occurred',
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //   );
    // }
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
