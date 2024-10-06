import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/res/app_url/static_variables.dart';
import 'package:jammer_mobile_app/data/network/network_api_services.dart';
import 'package:jammer_mobile_app/models/address/addrees_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum Operation {
  old,
  addAndOrder,
  update,
}

class DeliveryController extends GetxController {
  static DeliveryController get to => Get.find();
  final formKey = GlobalKey<FormState>();
  String addressid = "";
  final streetController = TextEditingController();
  final postalCodeController = TextEditingController();
  final cityController = TextEditingController();
  final regionController = TextEditingController();
  List<AddressModel> addressList = [];
  final NetworkApiServices network = NetworkApiServices();
  AddressModel? selectedAddress;
  Operation operation = Operation.addAndOrder;
  bool addAddressnew = false;
  addaddressbutton(bool value) {
    addAddressnew = value;
    if (addAddressnew) {
      addressid = "";
      streetController.clear();
      postalCodeController.clear();
      cityController.clear();
      regionController.clear();
    }
    update();
  }

  // Fetch addresses
  Future<void> getaddress() async {
    try {
      addressList.clear();
      final response1 = await network.getApi(StaticVariables.getAddresss);
      List res = response1.data["data"];
      res.forEach((element) {
        addressList.add(AddressModel.fromJson(element));
      });
      if (addressList.isNotEmpty) {
        selectAddress(addressList[0]);
        selectedAddress = addressList[0];
        // setState(() {});
      } else {}
      update();
      if (kDebugMode) {
        print("addressList: $addressList");
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  // Add a new address
  Future<void> addAddress(AddressModel address) async {
    try {
      final response =
          await network.postApi(StaticVariables.addAddress, address.toJson());
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Address added successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        await getaddress(); // Refresh address list
      } else {
        Fluttertoast.showToast(
          msg: "Failed to add address.",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  // Update an existing address
  Future<void> updateAddress(AddressModel address) async {
    try {
      final response =
          await network.putApi('${StaticVariables.updateAddress}', {
        "id": address.id,
        "userId": StaticVariables.model!.id,
        "city": address.city,
        "street": address.street,
        "postalCode": address.postalCode,
        "region": address.region
      });
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Address updated successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        await getaddress(); // Refresh address list
      } else {
        Fluttertoast.showToast(
          msg: "Failed to update address.",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  // Delete an address
  Future<void> deleteAddress(String id) async {
    try {
      final response =
          await network.deleteApi('${StaticVariables.deleteAddress}$id');
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Address deleted successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        await getaddress(); // Refresh address list
      } else {
        Fluttertoast.showToast(
          msg: "Failed to delete address.",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void selectAddress(AddressModel address) {
    // Update the form fields with the selected address details
    selectedAddress = address;
    streetController.text = address.street ?? '';
    addressid = address.id ?? '';
    cityController.text = address.city ?? '';
    postalCodeController.text = address.postalCode ?? '';
    regionController.text = address.region ?? '';
    update();
  }

  void showAddressSelectionBottomSheet(context) {
    addaddressbutton(false);
    operation = Operation.addAndOrder;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select an Address',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              GetBuilder<DeliveryController>(builder: (controller) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.addressList.length,
                  itemBuilder: (context, index) {
                    final address = controller.addressList[index];
                    return ListTile(
                      title: Text(address.street ?? ''),
                      subtitle: Text('${address.city}, ${address.region}'),
                      onTap: () {
                        selectAddress(address);

                        Navigator.pop(context);
                      },
                      trailing: InkWell(
                          onTap: () {
                            controller.deleteAddress(address.id!);
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.delete)),
                    );
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
