// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:jammer_mobile_app/res/app_url/static_variables.dart';
// import 'package:jammer_mobile_app/view/pages/login.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  @override
  Widget build(BuildContext context) {
    ListTile getListTile(title) {
      // Widget for common ListTile
      return ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.grey, fontSize: 18.0),
        ),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        ),
        onTap: () {},
      );
    }

    // Widget for common divider
    Padding getDivider() {
      return const Padding(
        padding: EdgeInsets.only(left: 12.0),
        child: Divider(
          height: 1.0,
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F6),
      appBar: AppBar(
        title: const Text('Account Setting'),
        titleSpacing: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            color: Colors.white,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Account',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                getListTile('Address'),
                getDivider(),
                getListTile('Telephone'),
                getDivider(),
                getListTile('Email'),
                getDivider(),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            color: Colors.white,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Setting',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                getListTile('Order Notifications'),
                getDivider(),
                getListTile('Discount Notifications'),
                getDivider(),
                getListTile('Credit Card'),
                getDivider(),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              StaticVariables.logout(context);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              color: Colors.white,
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
