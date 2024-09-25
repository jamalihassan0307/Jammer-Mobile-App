// ignore_for_file: unused_field

import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:jammer_mobile_app/models/CartModel.dart';
import 'package:jammer_mobile_app/view/pages/order_payment/payment.dart';
import 'package:page_transition/page_transition.dart';
import 'package:country_pickers/country_pickers.dart';

class Delivery extends StatefulWidget {
  final List<CartModel> productData;
  final int type;

  const Delivery({Key? key, required this.productData, required this.type})
      : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final _streetController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _regionController = TextEditingController();

  Country? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery'),
        backgroundColor: Theme.of(context).primaryColor,
        titleSpacing: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
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
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 18.0),
              SizedBox(
                width: width - 40.0,
                child: TextFormField(
                  controller: _streetController,
                  decoration: InputDecoration(
                    labelText: 'Street',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
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
                  controller: _postalCodeController,
                  decoration: InputDecoration(
                    labelText: 'Postal Code',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
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
                  controller: _cityController,
                  decoration: InputDecoration(
                    labelText: 'City',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
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
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CountryPickerDialog(
                        title: Text('Select Region'),
                        itemBuilder: (country) => ListTile(
                          leading:
                              CountryPickerUtils.getDefaultFlagImage(country),
                          title: Text(country.name),
                        ),
                        onValuePicked: (country) {
                          setState(() {
                            _selectedCountry = country;
                            _regionController.text = country.name;
                          });
                        },
                      ),
                    );
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: _regionController,
                      decoration: InputDecoration(
                        labelText: 'Region',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Region is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: PaymentPage(
                            type: widget.type,
                            productData: widget.productData,
                            phoneNumber: _phoneNumberController.text,
                            city: _cityController.text,
                            street: _streetController.text,
                            postalCode: _postalCodeController.text,
                            region: _regionController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: width - 40.0,
                    padding: const EdgeInsets.all(15.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Text(
                      'Go to Payment',
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
    );
  }
}
