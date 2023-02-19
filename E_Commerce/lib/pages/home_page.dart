import 'package:e_commerce/widget/drawer.dart';
import 'package:e_commerce/widget/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/catalog.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // for check
    final dummyList=List.generate(20, (index) => CatalogModel().items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel Rents"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          // for check
          // itemCount: CatalogModel().items.length,
          itemCount:dummyList.length,
          itemBuilder: (context, index){
            return ItemWidget(
              // for check
              // item: CatalogModel().items[index],
              item: dummyList[index],

            );
          },




        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
