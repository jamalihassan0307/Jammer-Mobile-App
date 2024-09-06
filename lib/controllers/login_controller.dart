// import 'package:dio/dio.dart';
// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
import 'package:jammer_mobile_app/data/network/APIStore.dart';
import 'package:jammer_mobile_app/models/login_model.dart';
import 'package:jammer_mobile_app/models/user_model.dart';
import 'package:jammer_mobile_app/view/pages/home.dart';
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
  Future<void> login(context) async {
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
    try {
      Map<String, dynamic> data = {"email": email, "password": password};
      final response =
          await httpClientNoToken().post(StaticVariables.login, data: data);

      if (response.statusCode == 200) {
        // final data = response.data;
        // Fluttertoast.showToast(
        //   msg: data['message'],
        //   backgroundColor: Colors.green,
        //   textColor: Colors.white,
        // );

        LoginModel logindata = LoginModel.fromMap(response.data);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', logindata.token);
        StaticVariables.tokenid = logindata.token;
        try {
          print("///////////////////login");
          final response1 = await httpClient().get(StaticVariables.getUserById);

          if (response1.statusCode == 200) {
            // final data = response1.data;
            Fluttertoast.showToast(
              msg: "Login Successfully",
              backgroundColor: Colors.green,
              textColor: Colors.white,
            );

            UserModel model = UserModel.fromMap(response1.data);

            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('UserId', model.id);
            StaticVariables.userid = model.id;
            StaticVariables.model = model;
            print("usermodel${model}");
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ));
          } else {
            Fluttertoast.showToast(
              msg: 'User data Not Found',
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          }
        } on DioError catch (e) {
          Fluttertoast.showToast(
            msg: e.message.toString(),
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: 'Login failed. Please try again.',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
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