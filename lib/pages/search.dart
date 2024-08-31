import 'package:flutter/material.dart';
import 'package:jammer_mobile_app/pages/category/top_offers.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search for Products',
            hintStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
            suffixIcon: Icon(Icons.search, color: Colors.white),
            border: InputBorder.none,
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
        titleSpacing: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 10.0),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const TopOffers(title: 'Best Laptops')),
              );
            },
            child: Image.asset('assets/slider/s5.jpg'),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0),
                  child: Text(
                    'Popular on GoKart',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Container(
                    height: 56.0,
                    width: 56.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                      border: Border.all(width: 0.3, color: Colors.grey),
                      image: const DecorationImage(
                        image: AssetImage(
                            "assets/best_of_fashion/best_of_fashion_1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  title: const Text(
                    'Ladies Panty',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: const Text(
                    'Best Offers',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const TopOffers(title: 'Ladies Panty')),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Container(
                    height: 56.0,
                    width: 56.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                      border: Border.all(width: 0.3, color: Colors.grey),
                      image: const DecorationImage(
                        image: AssetImage(
                            "assets/best_of_fashion/best_of_fashion_4.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  title: const Text(
                    'Ladies Lingerie',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: const Text(
                    'Best Offers',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const TopOffers(title: 'Ladies Lingerie')),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Container(
                    height: 56.0,
                    width: 56.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                      border: Border.all(width: 0.3, color: Colors.grey),
                      image: const DecorationImage(
                        image: AssetImage(
                            "assets/womens_collection/womens_collection_4.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  title: const Text(
                    'Ladies Inner Wear',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: const Text(
                    'Best Offers',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const TopOffers(title: 'Ladies Inner Wear')),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
