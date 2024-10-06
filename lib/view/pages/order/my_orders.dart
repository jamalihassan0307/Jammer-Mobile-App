import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:jammer_mobile_app/view_model/controllers/order/order_controller.dart';
import 'package:jammer_mobile_app/res/app_url/static_variables.dart';
import 'package:jammer_mobile_app/models/order/get_order_model.dart';
import 'package:jammer_mobile_app/res/components/home_page_component/best_deal.dart';
import 'package:jammer_mobile_app/repository/loading.dart';

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
    } else if (status == "Canceled") {
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

  var height, width;
  @override
  void initState() {
    super.initState();
    OrderController.to.getOrder();
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

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
                          Container(
                            padding: const EdgeInsets.only(
                                top: 5.0, right: 5.0, left: 5.0),
                            width: width,
                            height: order.items!.length >= 2
                                ? height * 0.6
                                : height * 0.32,
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0,
                                  crossAxisCount: 2,
                                  childAspectRatio: ((width) / 550),
                                ),
                                itemCount: order.items!.length,
                                primary: false,
                                itemBuilder: (BuildContext context, int index) {
                                  Items item = order.items![index];

                                  Color bg = beautifulColors[
                                      index % beautifulColors.length];
                                  return Container(
                                    margin: const EdgeInsets.all(5.0),
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                              color: bg,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                            child: Container(
                                              margin: const EdgeInsets.all(6.0),
                                              height: 150.0,
                                              child: item
                                                      .productImagePath!.isEmpty
                                                  ? Image(
                                                      image: AssetImage(
                                                          "assets/download5.jpg"),
                                                      fit: BoxFit.fitHeight,
                                                    )
                                                  : Image.network(
                                                      StaticVariables.baseurl +
                                                          item.productImagePath!,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 6.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                item.productName!,
                                                style: const TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(height: height * 0.01),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
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
      },
    );
  }
}
