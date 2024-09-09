// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
import 'package:jammer_mobile_app/view/pages/faq_and_about_app/about_app.dart';
import 'package:jammer_mobile_app/view/pages/faq_and_about_app/faq.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/login.dart';
import 'package:jammer_mobile_app/view/pages/my_account/account_setting.dart';
import 'package:jammer_mobile_app/view/pages/my_orders.dart';
import 'package:jammer_mobile_app/view/pages/notifications.dart';
import 'package:jammer_mobile_app/widget/loading.dart';
import 'package:page_transition/page_transition.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        titleSpacing: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            width: width,
            height: 360.0,
            child: Stack(
              children: <Widget>[
                Image(
                  image: const AssetImage('assets/user_profile/background.jpg'),
                  width: width,
                  height: 220.0,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 165.0,
                  right: ((width / 2) - 50.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 110.0,
                        width: 110.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(55.0),
                          border: Border.all(color: Colors.white, width: 5.0),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              GetImage(StaticVariables.model!.image)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          StaticVariables.model!.fullName,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: InkWell(
                          child: const Text(
                            'Edit Profile',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.grey),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),        
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const Notifications()));
            },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.bell,
                    size: 30.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    'Notifications',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 30.0, left: 70.0),
            child: Divider(
              height: 1.0,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const MyOrders()));
            },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.truck,
                    size: 30.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    'My Orders',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 30.0, left: 70.0),
            child: Divider(
              height: 1.0,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const AccountSetting()));
            },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.gears,
                    size: 30.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    'Account Setting',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 30.0, left: 70.0),
            child: Divider(
              height: 1.0,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const FaqPage()));
            },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.circleQuestion,
                    size: 30.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    'FAQ',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 30.0, left: 70.0),
            child: Divider(
              height: 1.0,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const AboutApp()));
            },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.info,
                    size: 30.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    'About App',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 30.0, left: 70.0),
            child: Divider(
              height: 1.0,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.rightFromBracket,
                    size: 30.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    'Logout',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 30.0, left: 70.0),
            child: Divider(
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
