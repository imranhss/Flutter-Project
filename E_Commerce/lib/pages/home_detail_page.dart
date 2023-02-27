import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:e_commerce/widget/themes.dart';
import 'package:e_commerce/models/catalog.dart';


class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) :assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyThemes.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mOnly(right: 16),
          children: [
            "Price \$ ${catalog.price}"
                .text
                .xl2
                .red500
                .make(),
            ElevatedButton(
              onPressed: () => {print(catalog.name)},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: "Buy".text.make(),
            ).wh(100,50)
          ],
        ).p32(),
      ),
      body: SafeArea(
          bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
            ).h32(context),
            Expanded(
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        30.heightBox,
                        catalog.name.text.xl4.color(MyThemes.darkBluish).bold.make(),
                        catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                        10.heightBox,
                      ],
                    ).py64(),
                  ),
                )
            )
          ],
        ),
      ),

    );
  }
}


