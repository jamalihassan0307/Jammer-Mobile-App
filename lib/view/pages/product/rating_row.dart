import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/controllers/card_controller.dart';

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

  Widget build(BuildContext context) {
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
                        obj.value,
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
          ],
        ),
      );
    });
  }
}
