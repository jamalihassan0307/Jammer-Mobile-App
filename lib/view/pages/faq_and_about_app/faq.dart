// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final faqList = [
    {
      'question': 'How can I return or exchange an item?',
      'answer':
          'To return/exchange your order, follow these simple steps: \n1. Go to My Orders \n2. Choose the item you wish to return or exchange \n3. Fill in the details \n4. Choose Request Return.'
    },
    {
      'question': 'How can I add a new delivery address to my GoKart account?',
      'answer':
          'To add a new delivery address, follow these simple steps:\n1. Log into your GoKart account\n2. Go to My Account › Settings ›\n3. Add details of your new address\n4. Choose \'Save Changes\''
    },
    {
      'question': 'What is the replacement process for orders?',
      'answer':
          'GoKart\'s Replacement Guarantee depends on the product category and the seller. Products are eligible for replacement if they are Damaged, Defective or Not as Described.\n\nHere\'s how you can raise a return request in a few simple steps:\n\n1. Create a \'Return Request\'\n - Login to GoKart\n- Choose the item you wish to return or exchange\n- Fill in the details\n- Choose Request Return\n- Choose Request Return\n\nOnce the return has been approved, the originally delivered item will be picked up\n\n3. Replacement initiated\nIn most cases, the replacement item is delivered to you at the time of pick-up. In all other cases, the replacement/refund is initiated after the originally delivered item is picked up.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F6),
      appBar: AppBar(
        title: const Text('GoKart FAQ'),
        titleSpacing: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          final item = faqList[index];
          return Card(
            elevation: 2.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: fullWidth - 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${item['question']}',
                          style: const TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 4.0, right: 8.0, left: 8.0, bottom: 8.0),
                        child: Text(
                          '${item['answer']}',
                          style: const TextStyle(
                            fontSize: 14.0,
                            height: 1.6,
                            color: Colors.grey,
                          ),
                        ),
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
  }
}
