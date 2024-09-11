import 'package:flutter/material.dart';
import 'package:jammer_mobile_app/controllers/home_controller.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
import 'package:jammer_mobile_app/models/get_category_model.dart';
import 'package:jammer_mobile_app/view/pages/cart.dart';
import 'package:jammer_mobile_app/view/pages/faq_and_about_app/about_app.dart';
import 'package:jammer_mobile_app/view/pages/faq_and_about_app/faq.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/login.dart';
import 'package:jammer_mobile_app/view/pages/my_account/my_account.dart';
import 'package:jammer_mobile_app/view/pages/my_orders.dart';
import 'package:jammer_mobile_app/view/pages/notifications.dart';
import 'package:jammer_mobile_app/view/pages/category/top_offers.dart';
import 'package:jammer_mobile_app/view/pages/wishlist.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Logout AlertDialog Start Here
    void showAlertDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: const Text(
              "Confirm",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text("Are you Sure you want to Logout?"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              TextButton(
                child: Text(
                  "Close",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

              TextButton(
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () {
                  StaticVariables.logout(context);
                },
              ),
            ],
          );
        },
      );
    }
    // Logout AlertDialog Ends Here

    return Drawer(
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                image: const DecorationImage(
                  image: AssetImage('assets/GoKart.png'),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            InkWell(
              child: Container(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 7.0, left: 15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.local_offer,
                      color: Colors.grey[700],
                      size: 20.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Top Offers',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                final item = GetCategoryModel(id: 0, name: "");
                print("item.id.toString()${item.id.toString()}");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TopOffers(
                            couponid: item.id,
                            title: '${item.name}',
                            id: item.id.toString(),
                          )),
                );
              },
            ),
            InkWell(
              child: Container(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 7.0, left: 15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.account_balance_wallet,
                      color: Colors.grey[700],
                      size: 20.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'My Orders',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyOrders()),
                );
              },
            ),
            InkWell(
              child: Container(
                padding:
                    const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.grey[700],
                      size: 20.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'My Cart',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
            ),
            InkWell(
              child: Container(
                padding:
                    const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.grey[700],
                      size: 20.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'My Wishlist',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WishlistPage()),
                );
              },
            ),
            InkWell(
              child: Container(
                padding:
                    const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.grey[700],
                      size: 20.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'My Account',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyAccount()),
                );
              },
            ),
            InkWell(
              child: Container(
                padding:
                    const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.notifications,
                      color: Colors.grey[700],
                      size: 20.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'My Notification',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Notifications()),
                );
              },
            ),
            const Divider(
              color: Colors.grey,
            ),
            ...HomeController.to.category.map(
              (item) => InkWell(
                child: Container(
                  padding:
                      const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.devices,
                        color: Colors.grey[700],
                        size: 20.0,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        item.name,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  print("DATAATATATATA${item}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TopOffers(
                              title: '${item.name}',
                              couponid: item.id,
                              id: item.id.toString(),
                            )),
                  );
                },
              ),
            ),

            // InkWell(
            //   child: Container(
            //     padding:
            //         const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
            //     child: Row(
            //       children: <Widget>[
            //         Icon(
            //           Icons.devices,
            //           color: Colors.grey[700],
            //           size: 20.0,
            //         ),
            //         const SizedBox(
            //           width: 10.0,
            //         ),
            //         Text(
            //           'Electronics',
            //           style: TextStyle(
            //             color: Colors.grey[700],
            //             fontSize: 15.0,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) =>
            //               const TopOffers(title: 'Electronics & Appliances')),
            //     );
            //   },
            // ),
            // InkWell(
            //   child: Container(
            //     padding:
            //         const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
            //     child: Row(
            //       children: <Widget>[
            //         Icon(
            //           Icons.wc,
            //           color: Colors.grey[700],
            //           size: 20.0,
            //         ),
            //         const SizedBox(
            //           width: 10.0,
            //         ),
            //         Text(
            //           'Fashion',
            //           style: TextStyle(
            //             color: Colors.grey[700],
            //             fontSize: 15.0,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const TopOffers(title: 'Fashion')),
            //     );
            //   },
            // ),
            // InkWell(
            //   child: Container(
            //     padding:
            //         const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
            //     child: Row(
            //       children: <Widget>[
            //         Icon(
            //           Icons.format_paint,
            //           color: Colors.grey[700],
            //           size: 20.0,
            //         ),
            //         const SizedBox(
            //           width: 10.0,
            //         ),
            //         Text(
            //           'Home & Furniture',
            //           style: TextStyle(
            //             color: Colors.grey[700],
            //             fontSize: 15.0,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) =>
            //               const TopOffers(title: 'Home & Furniture')),
            //     );
            //   },
            // ),
            // InkWell(
            //   child: Container(
            //     padding:
            //         const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
            //     child: Row(
            //       children: <Widget>[
            //         Icon(
            //           Icons.tv,
            //           color: Colors.grey[700],
            //           size: 20.0,
            //         ),
            //         const SizedBox(
            //           width: 10.0,
            //         ),
            //         Text(
            //           'TVs & Appliances',
            //           style: TextStyle(
            //             color: Colors.grey[700],
            //             fontSize: 15.0,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) =>
            //               const TopOffers(title: 'TVs & Appliances')),
            //     );
            //   },
            // ),
            // InkWell(
            //   child: Container(
            //     padding:
            //         const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
            //     child: Row(
            //       children: <Widget>[
            //         Icon(
            //           Icons.stay_current_portrait,
            //           color: Colors.grey[700],
            //           size: 20.0,
            //         ),
            //         const SizedBox(
            //           width: 10.0,
            //         ),
            //         Text(
            //           'Mobiles & Tablets',
            //           style: TextStyle(
            //             color: Colors.grey[700],
            //             fontSize: 15.0,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) =>
            //               const TopOffers(title: 'Mobiles & Tablets')),
            //     );
            //   },
            // ),
            // InkWell(
            //   child: Container(
            //     padding:
            //         const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
            //     child: Row(
            //       children: <Widget>[
            //         Icon(
            //           Icons.book,
            //           color: Colors.grey[700],
            //           size: 20.0,
            //         ),
            //         const SizedBox(
            //           width: 10.0,
            //         ),
            //         Text(
            //           'Bauty, Books & More',
            //           style: TextStyle(
            //             color: Colors.grey[700],
            //             fontSize: 15.0,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) =>
            //               const TopOffers(title: 'Beauty, Books & More')),
            //     );
            //   },
            // ),

            const Divider(
              color: Colors.grey,
            ),
            InkWell(
              child: Container(
                padding:
                    const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                child: Text(
                  'FAQ',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15.0,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FaqPage()),
                );
              },
            ),
            InkWell(
              child: Container(
                padding:
                    const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                child: Text(
                  'About App',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15.0,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutApp()),
                );
              },
            ),
            InkWell(
              child: Container(
                padding:
                    const EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15.0,
                  ),
                ),
              ),
              onTap: () {
                showAlertDialog();
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
