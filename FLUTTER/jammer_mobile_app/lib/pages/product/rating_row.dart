import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// My Own Import
import 'package:jammer_mobile_app/pages/product/all_rating.dart';
import 'package:page_transition/page_transition.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "4.3",
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
              '2814 ratings',
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
  }
}
