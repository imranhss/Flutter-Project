import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:e_commerce/models/catalog.dart';


class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) :assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
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
                backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: "Add To Cart".text.make(),
            ).wh(120,50)
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
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        30.heightBox,
                        catalog.name.text.xl4.color(context.accentColor).bold.make(),
                        catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                        10.heightBox,
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                              .text
                              .xl
                              .textStyle(context.captionStyle)
                              .make()
                              .p16(),

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


