import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool price1 = false,
      price2 = false,
      price3 = false,
      brand1 = false,
      brand2 = false,
      brand3 = false;
  bool occasion1 = false, occasion2 = false, occasion3 = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        titleSpacing: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      bottomNavigationBar: Material(
        elevation: 5.0,
        child: Container(
          color: Colors.white,
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: width / 2,
                  height: 50.0,
                  color: Theme.of(context).primaryColorLight,
                  alignment: Alignment.center,
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: width / 2,
                  height: 50.0,
                  color: Theme.of(context).primaryColor,
                  alignment: Alignment.center,
                  child: const Text(
                    'Apply',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
              child: const Text(
                'Price',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            checkbox("Rs. 499 and below", price1),
            checkbox("Rs. 500 to Rs. 799", price2),
            checkbox("Rs. 800 to Rs. 999", price3),
            const SizedBox(
              height: 8.0,
            ),
            const Divider(
              height: 1.0,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
              child: const Text(
                'Brand',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            checkbox("Calvin Klein", brand1),
            checkbox("Nike", brand2),
            checkbox("Puma", brand3),
            const SizedBox(
              height: 8.0,
            ),
            const Divider(
              height: 1.0,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
              child: const Text(
                'Occasion',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            checkbox("Casual", occasion1),
            checkbox("Party & Festive", occasion2),
            checkbox("Wedding", occasion3),
          ],
        ),
      ),
    );
  }

  Widget checkbox(String title, bool boolValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          value: boolValue,
          activeColor: Theme.of(context).primaryColor,
          onChanged: (bool? value) {
            setState(() {
              switch (title) {
                case "Rs. 499 and below":
                  price1 = value!;
                  break;

                case "Rs. 500 to Rs. 799":
                  price2 = value!;
                  break;

                case "Rs. 800 to Rs. 999":
                  price3 = value!;
                  break;

                case "Calvin Klein":
                  brand1 = value!;
                  break;

                case "Nike":
                  brand2 = value!;
                  break;

                case "Puma":
                  brand3 = value!;
                  break;

                case "Casual":
                  occasion1 = value!;
                  break;

                case "Party & Festive":
                  occasion2 = value!;
                  break;

                case "Wedding":
                  occasion3 = value!;
                  break;
              }
            });
          },
        ),
        Text(title),
      ],
    );
  }
}
