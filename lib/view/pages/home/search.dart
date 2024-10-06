import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jammer_mobile_app/view_model/controllers/search/search_controller.dart';
import 'package:jammer_mobile_app/res/components/functions/passDataToProduct.dart';
import 'package:jammer_mobile_app/models/Product/RandamProducts20.dart';
import 'package:jammer_mobile_app/res/components/home_page_component/best_deal.dart';
import 'package:jammer_mobile_app/view/pages/product/product.dart';
import 'package:jammer_mobile_app/repository/loading.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    Get.put(SearchPController());
    SearchPController.to.init();
    super.initState();
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    InkWell getStructuredGridCell(RandomProducts20 offers, Color bg) {
      return InkWell(
        child: Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5.0,
                color: Colors.grey,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: double.infinity,
                  margin: const EdgeInsets.all(6.0),
                  child: offers.imagePath.length == 0
                      ? Image(
                          image: AssetImage("assets/best_deal/best_deal_1.jpg"),
                          fit: BoxFit.fitHeight,
                        )
                      : Image.network(
                          GetImage(offers.imagePath[0]),
                          fit: BoxFit.fitHeight,
                        ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 6.0, left: 6.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      offers.name,
                      style: const TextStyle(fontSize: 12.0),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      offers.description,
                      style: const TextStyle(
                          color: Color(0xFF67A86B), fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          PassDataToProduct product = PassDataToProduct(
              offers.name,
              offers.id,
              offers.imagePath,
              offers.description,
              "",
              offers.price.toString(),
              "");
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductPage(
                      bg: bg,
                      productData: product,
                      coupon: 0,
                    )),
          );
        },
      );
    }

    return GetBuilder<SearchPController>(builder: (obj) {
      return obj.loading
          ? ProgressLoading()
          : Scaffold(
              appBar: AppBar(
                title: TextField(
                  controller: obj.searchcontroller,
                  onChanged: (v) {},
                  onSubmitted: (v) {
                    obj.serchProduct(v);
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search for Products',
                    hintStyle: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                    suffixIcon: Icon(Icons.search, color: Colors.white),
                    border: InputBorder.none,
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                titleSpacing: 0.0,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              body: GridView.count(
                shrinkWrap: true,
                primary: false,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 2,
                childAspectRatio: ((width) / 490),
                children: List.generate(
                    obj.searchlist.isEmpty
                        ? obj.randomProducts20list.length
                        : obj.searchlist.length, (index) {
                  Color bg = beautifulColors[index % beautifulColors.length];
                  return getStructuredGridCell(
                      obj.searchlist.isEmpty
                          ? obj.randomProducts20list[index]
                          : obj.searchlist[index],
                      bg);
                }),
              ));
    });
  }
}
