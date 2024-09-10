import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/controllers/home_controller.dart';
import 'package:jammer_mobile_app/data/const/static_variables.dart';
import 'package:jammer_mobile_app/models/get_category_model.dart';

// My Own Imports
import 'package:jammer_mobile_app/view/pages/category/top_offers.dart';

// ignore: must_be_immutable
class CategoryGrid extends StatelessWidget {
  CategoryGrid({super.key});

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<HomeController>(builder: (obj) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: EdgeInsets.all(5.0),
        alignment: Alignment.center,
        width: width - 20.0,
        height: height * 0.25,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 5,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            childAspectRatio: ((width) / 350),
          ),
          scrollDirection: Axis.horizontal,
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          itemCount: obj.category.length,
          itemBuilder: (BuildContext context, int index) {
            final item = index == 0
                ? GetCategoryModel(id: 0, name: "")
                : obj.category[index - 1];
            return InkWell(
              child: Column(
                children: [
                  index == 0
                      ? Image(
                          image: AssetImage("assets/category/top_offers.jpg"),
                          fit: BoxFit.fitHeight,
                        )
                      : Container(
                          height: height * 0.07,
                          child: Image.network(
                            StaticVariables.baseurl + item.image!,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                  SizedBox(
                    height: height * 0.04,
                    child: Text(
                      index == 0 ? "Top Offers" : item.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'Alatsi',
                      ),
                    ),
                  )
                ],
              ),
              onTap: () {
                final item = index == 0
                    ? GetCategoryModel(id: 0, name: "")
                    : obj.category[index - 1];
                print("item.id.toString()${item.id.toString()}");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TopOffers(
                            couponid: item.id,
                            title: '${item.name}',
                            id: item.id.toString(),
                          )),
                );
              },
            );
          },
        ),
      );
    });
  }
}
