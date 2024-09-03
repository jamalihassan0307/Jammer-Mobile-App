// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AllRating extends StatefulWidget {
  const AllRating({super.key});

  @override
  _AllRatingState createState() => _AllRatingState();
}

class _AllRatingState extends State<AllRating> {
  double averageRating = 0.0;

  final ratingList = [
    {
      'name': 'Don Hart',
      'rating': 4.5,
      'review': 'Nice Product.',
      'profile_image': 'assets/user_profile/user_1.jpg'
    },
    {
      'name': 'Lonnie Wallace',
      'rating': 5.0,
      'review': 'Amazing Service.',
      'profile_image': 'assets/user_profile/user_2.jpg'
    },
    {
      'name': 'Dawn Morales',
      'rating': 4.5,
      'review': 'Best Quality Product.',
      'profile_image': 'assets/user_profile/user_3.jpg'
    },
    {
      'name': 'Allison Perry',
      'rating': 4.0,
      'review': 'Not Bad.',
      'profile_image': 'assets/user_profile/user_4.jpg'
    },
    {
      'name': 'Anita Ruiz',
      'rating': 5.0,
      'review': 'Ontime Delivery.',
      'profile_image': 'assets/user_profile/user_5.jpg'
    },
    {
      'name': 'Charlie Jimenez',
      'rating': 4.0,
      'review': 'Really Impressive.',
      'profile_image': 'assets/user_profile/user_6.jpg'
    },
    {
      'name': 'Aiden Berry',
      'rating': 4.5,
      'review': 'Good.',
      'profile_image': 'assets/user_profile/user_7.jpg'
    },
    {
      'name': 'Bob Perez',
      'rating': 5.0,
      'review': 'Fantastic.',
      'profile_image': 'assets/user_profile/user_8.jpg'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.7;

    for (int i = 0; i < ratingList.length; i++) {
      averageRating = averageRating + int.parse('${ratingList[i]['rating']}');
    }

    averageRating = (averageRating / ratingList.length);

    String value = averageRating.toStringAsFixed(1);

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
                  value,
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
        itemCount: ratingList.length,
        itemBuilder: (context, index) {
          final item = ratingList[index];
          return Card(
            elevation: 2.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image(
                      image: AssetImage(
                        '${item['profile_image']}',
                      ),
                      height: 100.0,
                      width: 100.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: width - 16.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${item['name']}',
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
                                  "${item['rating']}",
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
                          '${item['review']}',
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
  }
}
