import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jammer_mobile_app/res/app_url/static_variables.dart';

class ProgressLoading extends StatelessWidget {
  const ProgressLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFoldingCube(
        color: Theme.of(context).primaryColor,
        size: 35.0,
      ),
    );
  }
}

GetImage(String image) {
  return "${StaticVariables.baseurl + image}";
}
