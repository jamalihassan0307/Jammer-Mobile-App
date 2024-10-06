import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/view_model/controllers/delivery/delivery_controller.dart';
import 'package:jammer_mobile_app/models/cart/CartModel.dart';
import 'package:jammer_mobile_app/models/address/addrees_model.dart';
import 'package:jammer_mobile_app/view/pages/order_payment/payment.dart';
import 'package:page_transition/page_transition.dart';

class Delivery extends StatefulWidget {
  final List<CartModel> productData;
  final int type;

  const Delivery({Key? key, required this.productData, required this.type})
      : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  // Country? _selectedCountry;

  @override
  void initState() {
    super.initState();
    Get.put(DeliveryController());
    DeliveryController.to.getaddress();
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<DeliveryController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Delivery'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'Where are your Ordered Items Shipped?',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Alatsi',
                          height: 1.6),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(
                      width: width - 40.0,
                      child: TextFormField(
                        controller: controller.streetController,
                        decoration: InputDecoration(
                          labelText: 'Street',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (v) {
                          if (controller.addressList.any((element) =>
                              element == controller.selectedAddress)) {
                            controller.operation = Operation.update;
                          } else if (controller.addressList.any((element) =>
                              element.id == controller.selectedAddress?.id)) {
                            controller.operation = Operation.update;
                          } else {
                            controller.operation = Operation.addAndOrder;
                          }
                          controller.update();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Street address is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    SizedBox(
                      width: width - 40.0,
                      child: TextFormField(
                        controller: controller.postalCodeController,
                        decoration: InputDecoration(
                          labelText: 'Postal Code',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (v) {
                          if (controller.addressList.any((element) =>
                              element == controller.selectedAddress)) {
                            controller.operation = Operation.update;
                          } else if (controller.addressList.any((element) =>
                              element.id == controller.selectedAddress?.id)) {
                            controller.operation = Operation.update;
                          } else {
                            controller.operation = Operation.addAndOrder;
                          }
                          controller.update();
                        },
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Postal code is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    SizedBox(
                      width: width - 40.0,
                      child: TextFormField(
                        controller: controller.cityController,
                        decoration: InputDecoration(
                          labelText: 'City',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (v) {
                          if (controller.addressList.any((element) =>
                              element == controller.selectedAddress)) {
                            controller.operation = Operation.update;
                          } else if (controller.addressList.any((element) =>
                              element.id == controller.selectedAddress?.id)) {
                            controller.operation = Operation.update;
                          } else {
                            controller.operation = Operation.addAndOrder;
                          }
                          controller.update();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'City is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    SizedBox(
                      width: width - 40.0,
                      child: TextFormField(
                        controller: controller.regionController,
                        decoration: InputDecoration(
                          labelText: 'Region',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (v) {
                          if (controller.addressList.any((element) =>
                              element == controller.selectedAddress)) {
                            controller.operation = Operation.update;
                          } else if (controller.addressList.any((element) =>
                              element.id == controller.selectedAddress?.id)) {
                            controller.operation = Operation.update;
                          } else {
                            controller.operation = Operation.addAndOrder;
                          }
                          controller.update();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Region is required';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 20.0),
                    GestureDetector(
                      onTap: () => controller.addaddressbutton(true),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: const Center(child: Text('Add Address')),
                      ),
                    ),

                    const SizedBox(height: 20.0),
                    InkWell(
                      onTap: () =>
                          controller.showAddressSelectionBottomSheet(context),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Text(
                          'Change Address',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    // Go to Payment button
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      child: InkWell(
                        onTap: () {
                          if (controller.formKey.currentState?.validate() ??
                              false) {
                            print("sdkcnsdjfs");
                            if (controller.addAddressnew) {
                              AddressModel address = AddressModel(
                                city: controller.cityController.text,
                                street: controller.streetController.text,
                                id: controller.addressid,
                                postalCode:
                                    controller.postalCodeController.text,
                                region: controller.regionController.text,
                              );
                              controller.addAddress(address);
                            } else if (controller.addressList.any((element) =>
                                element.city ==
                                    controller.selectedAddress!.city ||
                                element.street ==
                                    controller.selectedAddress!.street ||
                                element.postalCode ==
                                    controller.selectedAddress!.postalCode ||
                                element.region ==
                                    controller.selectedAddress!.region)) {
                              AddressModel address = AddressModel(
                                city: controller.cityController.text,
                                id: controller.addressid,
                                street: controller.streetController.text,
                                postalCode:
                                    controller.postalCodeController.text,
                                region: controller.regionController.text,
                              );
                              controller.updateAddress(address);
                            }
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: PaymentPage(
                                  type: widget.type,
                                  productData: widget.productData,
                                  city: controller.cityController.text,
                                  street: controller.streetController.text,
                                  postalCode:
                                      controller.postalCodeController.text,
                                  region: controller.regionController.text,
                                ),
                              ),
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: "Fill complete address !!",
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              gravity: ToastGravity.BOTTOM,
                              fontSize: 17,
                              timeInSecForIosWeb: 1,
                              toastLength: Toast.LENGTH_LONG,
                            );
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(15.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            controller.addAddressnew
                                ? " Go to Payment"
                                : controller.operation == Operation.addAndOrder
                                    ? 'Go to Payment'
                                    : 'Update Address and Go to Payment',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
