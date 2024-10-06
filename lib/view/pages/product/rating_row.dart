import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/view_model/controllers/cart/cart_controller.dart';

// My Own Import
import 'package:jammer_mobile_app/view/pages/product/all_rating.dart';
import 'package:page_transition/page_transition.dart';

class RatingRow extends StatefulWidget {
  final String id;
  const RatingRow({super.key, required this.id});

  @override
  State<RatingRow> createState() => _RatingRowState();
}

class _RatingRowState extends State<RatingRow> {
  @override
  void initState() {
    super.initState();
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<CartController>(builder: (obj) {
      return Container(
        margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Material(
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.grey[300],
              color: Colors.redAccent,
              borderOnForeground: false,
              elevation: 5.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const AllRating()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        double.parse(obj.averageRating.toStringAsFixed(1)).isNaN
                            ? "0.0"
                            : obj.averageRating.toStringAsFixed(1).toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Icon(
                        FontAwesomeIcons.solidStar,
                        size: 13.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            InkWell(
              child: Text(
                '${obj.total} ratings',
                style: TextStyle(color: Colors.grey[600], fontSize: 14.0),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const AllRating()));
              },
            ),
            Spacer(),
            Material(
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.grey[300],
              color: Colors.redAccent,
              borderOnForeground: false,
              elevation: 5.0,
              child: InkWell(
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      TextEditingController reviewController =
                          TextEditingController();
                      return StatefulBuilder(builder: (context, set) {
                        return SizedBox(
                          height: height * 0.5,
                          child: AlertDialog(
                            actions: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "No",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.05,
                              ),
                              InkWell(
                                onTap: () {
                                  // Add the rating and review
                                  obj.AddReview(int.parse(widget.id),
                                      reviewController.text);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ],
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  "Add Rating & Review",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.cancel_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            content: Container(
                              height: height * 0.2,
                              child: Column(
                                children: [
                                  // Rating bar
                                  RatingBar.builder(
                                    initialRating: 0,
                                    minRating: 1,
                                    unratedColor: Colors.grey,
                                    itemCount: 5,
                                    itemSize: 30,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    updateOnDrag: true,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    onRatingUpdate: (ratingValue) {
                                      set(() {
                                        setState(() {
                                          obj.fullrating = ratingValue;
                                          obj.update();
                                        });
                                      });
                                    },
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Rating: ${obj.fullrating}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  // TextField for review input
                                  TextField(
                                    controller: reviewController,
                                    decoration: InputDecoration(
                                      labelText: "Write your review",
                                      labelStyle: TextStyle(color: Colors.grey),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      border: OutlineInputBorder(),
                                    ),
                                    maxLines: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Add Rating",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      );
    });
  }
}
