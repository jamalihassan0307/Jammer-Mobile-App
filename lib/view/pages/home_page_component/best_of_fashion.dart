// import 'package:flutter/material.dart';

// // My Own Imports
// import 'package:jammer_mobile_app/view/pages/category/top_offers.dart';

// class BestOfFashion extends StatelessWidget {
//   const BestOfFashion({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       // height: 500.0,
//       child: Column(
//         children: <Widget>[
//           const TopImageBestFashion(),
//           OfferGridBestFashion(),
//         ],
//       ),
//     );
//   }
// }

// class TopImageBestFashion extends StatelessWidget {
//   const TopImageBestFashion({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         const Image(
//           image: AssetImage('assets/top_design/best_of_fashion.jpg'),
//         ),
//         Positioned(
//           top: 40.0,
//           left: 20.0,
//           child: Container(
//             alignment: Alignment.center,
//             padding: const EdgeInsets.all(0.0),
//             width: 320.0,
//             height: 50.0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 const Text(
//                   'Best Of Fashion',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.0,
//                   ),
//                 ),
//                 InkWell(
//                   child: Container(
//                     padding: const EdgeInsets.all(3.0),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(5.0),
//                       border: Border.all(
//                         color: Colors.black,
//                         width: 0.2,
//                       ),
//                     ),
//                     child: const Text(
//                       'View All',
//                     ),
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               const TopOffers(title: 'Best of Fashion')),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class OfferGridBestFashion extends StatelessWidget {
//   OfferGridBestFashion({super.key});
//   final bestFashionList = [
//     {
//       'image': 'assets/best_of_fashion/best_of_fashion_1.jpg',
//       'title': 'Panties',
//       'offer': 'Best Collection'
//     },
//     {
//       'image': 'assets/best_of_fashion/best_of_fashion_2.jpg',
//       'title': 'Puma',
//       'offer': 'Minimum 55% Off'
//     },
//     {
//       'image': 'assets/best_of_fashion/best_of_fashion_3.jpg',
//       'title': 'Quttos & X-Well',
//       'offer': 'Min. 50% Off'
//     },
//     {
//       'image': 'assets/best_of_fashion/best_of_fashion_4.jpg',
//       'title': 'Nighties & Nightdresses',
//       'offer': 'Starting at ₹399'
//     }
//   ];

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     InkWell getStructuredGridCell(bestFashionDeal) {
//       final item = bestFashionDeal;
//       return InkWell(
//         child: Container(
//           margin: const EdgeInsets.all(5.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10.0),
//             boxShadow: const [
//               BoxShadow(
//                 blurRadius: 5.0,
//                 color: Colors.grey,
//               ),
//             ],
//           ),
//           child: Column(
//             children: <Widget>[
//               Container(
//                 margin: const EdgeInsets.all(6.0),
//                 height: 150.0,
//                 child: Image(
//                   image: AssetImage(item['image']),
//                   fit: BoxFit.fitWidth,
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 child: Column(
//                   children: <Widget>[
//                     Text(
//                       '${item['title']}',
//                       style: const TextStyle(fontSize: 12.0),
//                     ),
//                     Text(
//                       '${item['offer']}',
//                       style: const TextStyle(
//                           color: Color(0xFF67A86B), fontSize: 16.0),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => TopOffers(title: '${item['title']}')),
//           );
//         },
//       );
//     }

//     return Column(
//       children: <Widget>[
//         SizedBox(
//           width: width,
//           height: 479.0,
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 width: width,
//                 height: 460.0,
//                 decoration: const BoxDecoration(
//                   color: Color(0xFF18429D),
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(5.0),
//                 ),
//                 padding: const EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
//                 width: width - 20.0,
//                 margin:
//                     const EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
//                 child: GridView.count(
//                   primary: false,
//                   crossAxisSpacing: 0,
//                   mainAxisSpacing: 0,
//                   crossAxisCount: 2,
//                   childAspectRatio: ((width) / 500),
//                   children: List.generate(bestFashionList.length, (index) {
//                     return getStructuredGridCell(bestFashionList[index]);
//                   }),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
