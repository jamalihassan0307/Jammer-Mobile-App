// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About App'),
        titleSpacing: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'GoKart Ecommerce App UI in Flutter',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'GoKart is a multipurpose ecommerce app ui template. GoKart is built in flutter. Flutter is a Hybrid App Development Platform. So, GoKart Compatible with Android and iOs both.',
                    style: TextStyle(fontSize: 15.0, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'GoKart is a developed by Render Code. We are expert flutter developer team.',
                    style: TextStyle(fontSize: 15.0, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Thanks for Installing our App',
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                ),
                Divider(
                  height: 1.0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'render_code',
                    style: TextStyle(fontSize: 15.0, color: Colors.blue),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
