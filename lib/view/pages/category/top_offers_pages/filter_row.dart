// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/category/filter.dart';
import 'package:page_transition/page_transition.dart';

class FilterRow extends StatefulWidget {
  const FilterRow({super.key});

  @override
  _FilterRowState createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  int? selectedRadioSort;
  bool satVal = false;
  bool sunVal = false;

  @override
  void initState() {
    super.initState();
    selectedRadioSort = 0;
  }

  setSelectedRadioSort(int val) {
    setState(() {
      selectedRadioSort = val;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              _sortModalBottomSheet(context);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.sort,
                  size: 25.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Sort',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 20.0,
            width: 1.0,
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const Filter()));
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.filter_list,
                  size: 25.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Filter',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sortModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    const Text(
                      'SORT BY',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Divider(
                      height: 1.0,
                    ),
                    RadioListTile(
                      value: 1,
                      groupValue: selectedRadioSort,
                      title: const Text("Popularity"),
                      onChanged: (val) {
                        setSelectedRadioSort(val!);
                      },
                      activeColor: Colors.blue,
                    ),
                    RadioListTile(
                      value: 2,
                      groupValue: selectedRadioSort,
                      title: const Text("Price -- Low to High"),
                      onChanged: (val) {
                        setSelectedRadioSort(val!);
                      },
                      activeColor: Colors.blue,
                    ),
                    RadioListTile(
                      value: 3,
                      groupValue: selectedRadioSort,
                      title: const Text("Price -- High to Low"),
                      onChanged: (val) {
                        setSelectedRadioSort(val!);
                      },
                      activeColor: Colors.blue,
                    ),
                    RadioListTile(
                      value: 4,
                      groupValue: selectedRadioSort,
                      title: const Text("Newest First"),
                      onChanged: (val) {
                        setSelectedRadioSort(val!);
                      },
                      activeColor: Colors.blue,
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
