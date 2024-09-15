import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:jammer_mobile_app/controllers/order_controller.dart';
import 'package:jammer_mobile_app/models/get_order_model.dart';
import 'package:jammer_mobile_app/widget/loading.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  Container checkStatus(String status) {
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
              GetOrderModel order = controller.orderList[index];
              DateTime orderDateTime = DateTime.parse(order.orderDate!);
              String formattedOrderDate = _dateFormat.format(orderDateTime);

              return Slidable(
                key: ValueKey(index),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  extentRatio: 0.16,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.cancelOrder(order.orderId!);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 3.0,
                        ),
                        width: MediaQuery.of(context).size.width * 0.16,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: Text('Order #${order.orderId}'),
                  subtitle: checkStatus(order.status!),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Order Date: $formattedOrderDate'),
                          Text('Total Amount: RS ${order.totalAmount}'),
                          Text('Phone: ${order.phoneNumber}'),
                          Text('City: ${order.city}'),
                          Text('Street: ${order.street}'),
                          Text('Postal Code: ${order.postalCode}'),
                          Text('Region: ${order.region}'),
                          const SizedBox(height: 10.0),
                          ...order.items!.map((item) {
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
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 120.0,
                                            height: 160.0,
                                            alignment: Alignment.center,
                                            child: Image.network(
                                              GetImage(item.productImagePath!),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    '${item.productName}',
                                                    style: const TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 7.0),
                                                  Row(
                                                    children: <Widget>[
                                                      const Text(
                                                        'Price:',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 15.0,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          width: 10.0),
                                                      Text(
                                                        'RS ${item.price}',
                                                        style: const TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 15.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 7.0),
                                                  Row(
                                                    children: <Widget>[
                                                      RichText(
                                                        text: TextSpan(
                                                          text: 'Size:  ',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      15.0,
                                                                  color: Colors
                                                                      .grey),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: '  size',
                                                              style: const TextStyle(
                                                                  fontSize:
                                                                      15.0,
                                                                  color: Colors
                                                                      .blue),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          width: 10.0),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
