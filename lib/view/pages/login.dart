// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/controllers/login_controller.dart';
import 'package:jammer_mobile_app/pages/signup.dart';
import 'package:jammer_mobile_app/pages/forgot_password.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    Get.put(LoginController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      id: ["all"],
      builder: (controller) {
        return Scaffold(
          body: WillPopScope(
            onWillPop: () async {
              bool backStatus = controller.onWillPop();
              if (backStatus) {
                exit(0);
              }
              return Future.value(false);
            },
            child: ListView(
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.only(top: 70.0, right: 30.0, left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Alatsi',
                        ),
                      ),
                      InkWell(
                        child: const Text(
                          'Sign Up',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Alatsi',
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signup()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 50.0, left: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/GoKart.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      GetBuilder<LoginController>(
                        id: ["emailField"],
                        builder: (obj) {
                          return TextField(
                            controller: obj.emailController,
                            decoration: InputDecoration(
                              hintText: 'Email Address',
                              errorText: obj.emailError,
                              contentPadding: const EdgeInsets.only(
                                  top: 12.0, bottom: 12.0),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10.0),
                      GetBuilder<LoginController>(
                        id: ["passwordField", "viewPassword"],
                        builder: (obj) {
                          return TextField(
                            controller: obj.passwordController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              errorText: obj.passwordError,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  obj.obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: obj.viewPassword(),
                              ),
                              contentPadding: const EdgeInsets.only(
                                  top: 12.0, bottom: 12.0),
                            ),
                            obscureText: obj.obscureText,
                          );
                        },
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: 'Alatsi',
                              fontSize: 15.0,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgotPassword()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 50.0),
                      InkWell(
                        onTap: () {
                          // if (controller.validateLogin()) {
                          controller.login();
                          // } else {
                          //   Fluttertoast.showToast(
                          //     msg: 'Please fix the errors before submitting',
                          //     backgroundColor: Colors.red,
                          //     textColor: Colors.white,
                          //   );
                          // }
                        },
                        child: SizedBox(
                          height: 45.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.grey[300],
                            color: Colors.white,
                            borderOnForeground: false,
                            elevation: 5.0,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.check,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  const SizedBox(width: 7.0),
                                  Text(
                                    "LOG IN",
                                    style: TextStyle(
                                      fontFamily: 'Alatsi',
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Don\'t Have an Account?',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 15.0,
                              fontFamily: 'Alatsi',
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          InkWell(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 18.0,
                                fontFamily: 'Alatsi',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signup()),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      const Text(
                        "Continue with",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                          fontFamily: 'Alatsi',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            child: Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                image: const DecorationImage(
                                  image: AssetImage('assets/google_plus.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0)),
                                border: Border.all(width: 0.0),
                              ),
                            ),
                            onTap: () {},
                          ),
                          const SizedBox(width: 18.0),
                          InkWell(
                            child: Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: const DecorationImage(
                                  image: AssetImage('assets/fb.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0)),
                                border: Border.all(width: 0.0),
                              ),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
