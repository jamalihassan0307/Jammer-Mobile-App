// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:jammer_mobile_app/view/pages/signup.dart';
import 'package:jammer_mobile_app/view/pages/login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 70.0, right: 30.0, left: 30.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alatsi',
                  ),
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
                const SizedBox(
                  height: 30.0,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Registered Email Address',
                    contentPadding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                  ),
                ),
                const SizedBox(height: 50.0),
                InkWell(
                  child: SizedBox(
                    height: 45.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.grey[300],
                      color: Colors.white,
                      borderOnForeground: false,
                      elevation: 5.0,
                      child: GestureDetector(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.check,
                                color: Theme.of(context).primaryColor,
                              ),
                              const SizedBox(
                                width: 7.0,
                              ),
                              Text(
                                "RESET PASSWORD",
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Signup()),
                    );
                  },
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Go To',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15.0,
                        fontFamily: 'Alatsi',
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      child: Text(
                        'Login',
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
                              builder: (context) => const Login()),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
