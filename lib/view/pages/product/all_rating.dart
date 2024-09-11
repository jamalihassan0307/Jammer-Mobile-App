// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/controllers/cart_controller.dart';
import 'package:jammer_mobile_app/models/review_model.dart';
import 'package:jammer_mobile_app/widget/loading.dart';

class AllRating extends StatefulWidget {
  const AllRating({super.key});

  @override
  _AllRatingState createState() => _AllRatingState();
}

class _AllRatingState extends State<AllRating> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<CartController>(builder: (obj) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('All Rating'),
          titleSpacing: 0.0,
          backgroundColor: Theme.of(context).primaryColor,
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    obj.averageRating.toString(),
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    size: 18.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: obj.reviewlist.length,
          itemBuilder: (context, index) {
            ReviewModel item = obj.reviewlist[index];
            return Card(
              elevation: 2.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(
                        GetImage(
                          item.image!,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${item.fullname}',
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.grey[300],
                            color: Colors.redAccent,
                            borderOnForeground: false,
                            elevation: 5.0,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "${item.points}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 3.0,
                                  ),
                                  const Icon(
                                    FontAwesomeIcons.solidStar,
                                    size: 13.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, right: 8.0, left: 8.0, bottom: 8.0),
                          child: Text(
                            '${item.message}',
                            style: const TextStyle(
                              fontSize: 14.0,
                              height: 1.6,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
