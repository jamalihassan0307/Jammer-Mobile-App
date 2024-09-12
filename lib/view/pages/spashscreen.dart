// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
// import 'package:jammer_mobile_app/data/network/APIStore.dart';
import 'package:jammer_mobile_app/data/network/network_api_services.dart';
import 'package:jammer_mobile_app/models/user_model.dart';
import 'package:jammer_mobile_app/view/pages/home.dart';
import 'package:jammer_mobile_app/view/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    moveToPage();
    // Timer(
    //     const Duration(seconds: 5),
    //     () => Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => const Login()),
    //         ));
  }

  moveToPage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? value = sharedPreferences.getString("token");
    String? usedid = sharedPreferences.getString("UserId");
    if (value != null) {
      print("TOKKEN ${value}");
      StaticVariables.tokenid = value;
      StaticVariables.userid = usedid;
      try {
        print("///////////////////login");
        NetworkApiServices network = NetworkApiServices();
        final response1 = await network.getApi(StaticVariables.getUserById);
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
      } on DioError catch (e) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Login()));
        Fluttertoast.showToast(
          msg: e.response.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } else {
      Future.delayed(const Duration(milliseconds: 2500), () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Login()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: Image(
                        image: AssetImage(
                          'assets/GoKart.png',
                        ),
                        width: 65.0,
                        height: 65.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "GoKart",
                      style: TextStyle(
                          fontFamily: 'Pacifico',
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SpinKitFoldingCube(
                      color: Theme.of(context).primaryColorLight,
                      size: 35.0,
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Flutter Ecommerce \n UI Template',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
