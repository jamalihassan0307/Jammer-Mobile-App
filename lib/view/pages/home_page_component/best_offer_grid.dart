// import 'package:flutter/material.dart';

// // My Own Imports
// import 'package:jammer_mobile_app/view/pages/category/top_offers.dart';

// class BestOfferGrid extends StatelessWidget {
//   BestOfferGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     return Container(
//       padding: const EdgeInsets.all(0.0),
//       alignment: Alignment.center,
//       width: width - 20.0,
//       child: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisSpacing: 0,
//           mainAxisSpacing: 0,
//           crossAxisCount: 3,
//         ),
//         shrinkWrap: true,
//         primary: false,
//         padding: const EdgeInsets.all(0),
//         itemCount: 3,
//         itemBuilder: (BuildContext context, int index) {
//           return InkWell(
//             child: Image(
//               image: AssetImage("assets/best_offer/best_offer_1.jpg"),
//               fit: BoxFit.fitHeight,
//             ),
//             onTap: () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //       builder: (context) => TopOffers(title: '${item['title']}')),
//               // );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
