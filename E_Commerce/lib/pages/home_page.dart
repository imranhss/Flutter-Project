import 'package:e_commerce/widget/drawer.dart';
import 'package:e_commerce/pages/home_detail_page.dart';
import 'package:e_commerce/widget/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/catalog.dart';
import 'dart:convert';
import "package:velocity_x/velocity_x.dart";
import 'package:e_commerce/widget/themes.dart';

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
        backgroundColor: MyThemes.creamColor,
        appBar: AppBar(
          title: Text("Hotel Rents"),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.item != null && CatalogModel.item.isNotEmpty)
                  CatalogList().expand()
                else
                  CircularProgressIndicator().centered().py16().expand(),
              ],
            ),
          ),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalaog App".text.xl5.bold.color(MyThemes.darkBluish).make(),
        "Trending Products".text.xl2.bold.color(MyThemes.darkBluish).make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.item.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.item[index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeDetailPage(catalog: catalog))),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.xl2.color(MyThemes.darkBluish).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.mOnly(right: 16),
                children: [
                  "Price \$ ${catalog.price}"
                      .text
                      .xl2
                      .color(MyThemes.darkBluish)
                      .make(),
                  ElevatedButton(
                    onPressed: () => {print(catalog.name)},
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make(),
                  )
                ],
              ),
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyThemes.creamColor)
        .make()
        .py16()
        .w32(context);
  }
}
