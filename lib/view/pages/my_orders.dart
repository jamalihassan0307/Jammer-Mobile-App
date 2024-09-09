import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/controllers/order_controller.dart';
import 'package:jammer_mobile_app/widget/loading.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  Container checkStatus(String status) {
    // status 1 => Out for Delivery
    // status 2 => Shipped
    // status 3 => Delivered

    if (status == "Pending") {
      return Container(
        padding: const EdgeInsets.all(5.0),
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(topRight: Radius.circular(5.0)),
        ),
        child: Text(
          status,
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
      );
    } else if (status == "Cencal") {
      return Container(
        padding: const EdgeInsets.all(5.0),
        decoration: const BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.only(topRight: Radius.circular(5.0)),
        ),
        child: Text(
          status,
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(5.0),
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(topRight: Radius.circular(5.0)),
        ),
        child: Text(
          status,
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Orders'),
            titleSpacing: 0.0,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: ListView.builder(
            itemCount: controller.orderList.length,
            itemBuilder: (context, index) {
              final order = controller.orderList[index];
              return ExpansionTile(
                initiallyExpanded: true,
                title: Text('Order #${order.orderId}'),
                subtitle: checkStatus(order.status!),
                children: order.items!.map((item) {
                  return SizedBox(
                    height: 180.0,
                    child: Card(
                        elevation: 5.0,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 0,
                              right: 0,
                              child: checkStatus(order.status!),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                              width: 120.0,
                                              height: 160.0,
                                              alignment: Alignment.center,
                                              child: Image.network(
                                                GetImage(
                                                    item.productImagePath!),
                                                fit: BoxFit.fitHeight,
                                              )),
                                        ],
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                '${item.productName}',
                                                style: const TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 7.0,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  const Text(
                                                    'Price:',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Text(
                                                    '₹${item.price}',
                                                    style: const TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 7.0,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  RichText(
                                                    text: TextSpan(
                                                      text: 'Size:  ',
                                                      style: const TextStyle(
                                                          fontSize: 15.0,
                                                          color: Colors.grey),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text: '  size',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        15.0,
                                                                    color: Colors
                                                                        .blue)),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10.0,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  );
                  // ListTile(
                  //   leading: Image.network(GetImage(item.productImagePath![0])),
                  //   title: Text('${item.productName}'),
                  //   subtitle: Text('₹${item.price} x ${item.quantity}'),
                  //   trailing: Text('Total: ₹${item.price! * item.quantity!}'),
                  // );
                }).toList(),
                onExpansionChanged: (bool expanded) {
                  if (expanded) {}
                },
              );
            },
          ),
        );
      },
    );
  }
}
