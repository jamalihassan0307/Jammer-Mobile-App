// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async' show Future, Timer;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_spinkit/flutter_spinkit.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/category/top_offers_pages/women_wears.dart';

class TopOffers extends StatefulWidget {
  final String? title;

  const TopOffers({Key? key, this.title}) : super(key: key);

  @override
  _TopOffersState createState() => _TopOffersState();
}

class _TopOffersState extends State<TopOffers> {
  bool progress = true;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      setState(() {
        progress = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.title!),
        titleSpacing: 0.0,
      ),
      backgroundColor: const Color(0xFFF1F3F6),
      body: (progress)
          ? Center(
              child: SpinKitFoldingCube(
                color: Theme.of(context).primaryColor,
                size: 35.0,
              ),
            )
          : FutureBuilder<List<Offers>>(
              future: loadOffers(),
              builder: (context, snapshot) {
                // ignore: avoid_print
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? ListView(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Deals of the Day(8 Results)',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Divider(
                            height: 1.0,
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: OffersGridView(offers: snapshot.data!)),
                        ],
                      )
                    : Center(
                        child: SpinKitFoldingCube(
                        color: Theme.of(context).primaryColor,
                        size: 35.0,
                      ));
              },
            ),
    );
  }
}

class OffersGridView extends StatefulWidget {
  final List<Offers>? offers;

  const OffersGridView({Key? key, this.offers}) : super(key: key);

  @override
  _OffersGridViewState createState() => _OffersGridViewState();
}

class _OffersGridViewState extends State<OffersGridView> {
  InkWell getStructuredGridCell(Offers offers) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
              color: Colors.grey,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: double.infinity,
                margin: const EdgeInsets.all(6.0),
                child: Image(
                  image: AssetImage(offers.offerImage),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 6.0, left: 6.0),
              child: Column(
                children: <Widget>[
                  Text(
                    offers.offerTitle,
                    style: const TextStyle(fontSize: 12.0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    offers.offerText,
                    style: const TextStyle(
                        color: Color(0xFF67A86B), fontSize: 15.0),
                  ),
                  Text(
                    offers.offerSubTitle,
                    style: const TextStyle(fontSize: 12.0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WomensWear(
                  data: PassData(offers.offerTitle, offers.offerId))),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 2,
      childAspectRatio: ((width) / 490),
      children: List.generate(widget.offers!.length, (index) {
        return getStructuredGridCell(widget.offers![index]);
      }),
    );
  }
}

class Offers {
  int offerId;
  String offerImage;
  String offerTitle;
  String offerText;
  String offerSubTitle;

  Offers(this.offerId, this.offerImage, this.offerTitle, this.offerText,
      this.offerSubTitle);
}

Future<List<Offers>> loadOffers() async {
  var jsonString = await rootBundle.loadString('assets/json/top_offers.json');
  final jsonResponse = json.decode(jsonString);

  List<Offers> offers = [];

  for (var o in jsonResponse) {
    Offers offer =
        Offers(o["offerid"], o["image"], o["title"], o["offer"], o["subtitle"]);

    offers.add(offer);
  }

  return offers;
}

class PassData {
  final String title;
  final int offerid;

  PassData(this.title, this.offerid);
}
