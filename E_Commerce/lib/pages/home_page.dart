import 'package:e_commerce/widget/drawer.dart';
import 'package:e_commerce/widget/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/catalog.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    //print(catalogJson);
    var decodeData = jsonDecode(catalogJson);
    //print(decodeData);
    var productsData = decodeData["products"];
    // print(productsData);
    CatalogModel.item = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // for check
    // final dummyList=List.generate(20, (index) => CatalogModel().items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel Rents"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemCount: CatalogModel.item.length,
              itemBuilder: (context, index) {
                final it = CatalogModel.item[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GridTile(
                    header: Container(
                      padding: const EdgeInsets.all(12.0),

                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                        child: Text(it.name,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        )
                    ),
                    child: Image.network(it.image,
                    fit: BoxFit.cover,
                      height: 50,
                    ),
                    footer: Container(
                        child: Text("Price \$ ${it.price.toString()}",
                          style: TextStyle(
                          color: Colors.white,
                        ),
                        ),
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              })
          // ---------------End Grid View----------------------

          // ListView.builder(
          //   // for check
          //   itemCount: CatalogModel.item.length,
          //   // itemCount:dummyList.length,
          //   itemBuilder: (context, index){
          //     return ItemWidget(
          //       // for check
          //       // item: CatalogModel().items[index],
          //       // item: dummyList[index],
          //       item: CatalogModel.item[index],
          //
          //     );
          //   },
          //
          // ),
          ),
      drawer: MyDrawer(),
    );
  }
}
