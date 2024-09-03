// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:jammer_mobile_app/view/pages/login.dart';
import 'package:jammer_mobile_app/view/pages/home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Initially password is obscure
  bool _obscureText = true;
  bool _obscureText1 = true;

  // Toggles the password show status
  void _viewPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _viewPassword1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 70.0, right: 30.0, left: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: const Text(
                    "Login",
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
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                ),
                const Text(
                  'Sign Up',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
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
                  height: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        contentPadding:
                            EdgeInsets.only(top: 12.0, bottom: 12.0),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                        contentPadding:
                            EdgeInsets.only(top: 12.0, bottom: 12.0),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.remove_red_eye),
                          onPressed: _viewPassword,
                        ),
                        contentPadding:
                            const EdgeInsets.only(top: 12.0, bottom: 12.0),
                      ),
                      obscureText: _obscureText,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Repeat Password',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.remove_red_eye),
                          onPressed: _viewPassword1,
                        ),
                        contentPadding:
                            const EdgeInsets.only(top: 12.0, bottom: 12.0),
                      ),
                      obscureText: _obscureText1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
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
                                "SIGN UP",
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
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an account?',
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
